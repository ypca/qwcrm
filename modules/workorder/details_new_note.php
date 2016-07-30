<?php
####################################################
# IN                                               #    
#                                                  #
#  This program is distributed under the terms and #
#  conditions of the GPL                           #
#  New Note                                        #
#  Version 0.0.1    Sat Nov 26 20:46:40 PST 2005   #
#                                                  #
####################################################

require_once('include.php');

if(empty($VAR['wo_id'])){
    force_page('core', 'error&error_msg=No Work Order ID');
    exit;
}

$workorder_note = $VAR['workorder_note'];

if(isset($VAR['submit'])){

    if (!insert_new_note($db, $wo_id, $work_order_note_content)) {
        force_page('core', 'error&error_msg=Falied to insert Work Order Note');
        exit;
    } else {
        force_page('workorder', 'details&wo_id='.$VAR['wo_id'].'&page_title=Work%20Order%20ID%20'.$VAR['wo_id']);
        exit;
    }

} else {
    $smarty->assign('wo_id', $VAR['wo_id']);
    $smarty->display('workorder'.SEP.'details_new_note.tpl');
}