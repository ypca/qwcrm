<?php
/**
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
 */

defined('_QWEXEC') or die;

/* Pre-Processing */
// goes here

/* Invoice Processing */

// Validate the basic invoice totals after the payment is applied, then if successful return the results
if(!$new_invoice_totals = validate_payment_method_totals($VAR['qpayment']['invoice_id'], $VAR['qpayment']['amount'])) {
    
    // Do nothing - Specific Error information has already been set via postEmulation    
    
} else {

    /* Processing */

    // Live processing goes here

    // Create a specific note string (if applicable)
    $note = '<p>'._gettext("Transfer Reference").': '.$VAR['qpayment']['transfer_reference'].'</p>';
    if($VAR['qpayment']['note']) { $note .= '<p>'.$VAR['qpayment']['note'].'</p>'; }
    $VAR['qpayment']['note'] = $note;
    
    // Insert the payment with the calculated information
    insert_payment($VAR['qpayment']);
    
    // Assign Success message
    $smarty->assign('information_msg', _gettext("Bank Transfer payment added successfully"));
    
    /* Post-Processing */
    // goes here    
        
    // After a sucessful process redirect to the invoice payment page
    //force_page('invoice', 'details&invoice_id='.$VAR['qpayment']['invoice_id'], 'information_msg=Full Payment made successfully');
    
}