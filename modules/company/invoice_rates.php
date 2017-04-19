<?php

require(INCLUDES_DIR.'modules/company.php');

// Upload CSV file if submitted
if(isset($VAR['csv_upload'])) {
    upload_invoice_rates_csv($db, $VAR);
}

// Now if we edit/add a new item
if(isset($VAR['submit'])) {
    
    // edit invoice rate item
    if($VAR['submit'] == 'update') {            
        edit_invoice_rates_item($db, $VAR);        
    }
    
    // delete invoice rate rate
    if($VAR['submit'] == 'delete') {
        delete_invoice_rates_item($db, $VAR);
    }

    // New invoice rate rate
    if($VAR['submit'] == 'new') {
        new_invoice_rates_item($db, $VAR);
    }
    
}

// Fetch Page
$smarty->assign('invoice_rates_items', get_invoice_rates_item($db));
$BuildPage .= $smarty->fetch('company/invoice_rates.tpl');
    