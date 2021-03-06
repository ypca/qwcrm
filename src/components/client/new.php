<?php
/**
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
 */

defined('_QWEXEC') or die;

require(INCLUDES_DIR.'client.php');

if(isset($VAR['submit'])) {

    // Create the new Client
    $VAR['client_id'] = insert_client($VAR);
    
    // Load the new Client's Details page
    force_page('client', 'details&client_id='.$VAR['client_id']);
    
} else {
    
    // Build the page
    $smarty->assign('client_types', get_client_types());
    $BuildPage .= $smarty->fetch('client/new.tpl');

}