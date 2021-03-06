<?php
/**
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
 */

defined('_QWEXEC') or die;

require(INCLUDES_DIR.'client.php');
require(INCLUDES_DIR.'invoice.php');
require(INCLUDES_DIR.'giftcert.php');
require(INCLUDES_DIR.'payment.php');
require(INCLUDES_DIR.'workorder.php');

// Check if we have an giftcert_id
if(!isset($VAR['giftcert_id']) || !$VAR['giftcert_id']) {
    force_page('giftcert', 'search', 'warning_msg='._gettext("No Gift Certificate ID supplied."));
}

// Check if giftcert payment method is enabled
if(!check_payment_method_is_active('gift_certificate')) {
    force_page('index.php', 'null', 'warning_msg='._gettext("Gift Certificate payment method is not enabled. Goto Payment Options and enable Gift Certificates there."));
}

// Check if giftcert can be edited
if(!check_giftcert_status_allows_editing($VAR['giftcert_id'])) {
    force_page('giftcert', 'details&giftcert_id='.$VAR['giftcert_id'], 'warning_msg='._gettext("You cannot edit this Gift Certificate because its status does not allow it."));
}

// if information submitted
if(isset($VAR['submit'])) {
    
    // Create a new gift certificate
    update_giftcert($VAR['giftcert_id'], $VAR['date_expires'], $VAR['amount'], $VAR['note']);

    // Load the new Gift Certificate's Details page
    force_page('giftcert', 'details&giftcert_id='.$VAR['giftcert_id']);    

} else {
    
    // Build the page    
    $smarty->assign('client_details',    get_client_details(get_giftcert_details($VAR['giftcert_id'], 'client_id'))); 
    $smarty->assign('giftcert_statuses', get_giftcert_statuses());
    $smarty->assign('giftcert_details',  get_giftcert_details($VAR['giftcert_id']));
    $BuildPage .= $smarty->fetch('giftcert/edit.tpl');
}