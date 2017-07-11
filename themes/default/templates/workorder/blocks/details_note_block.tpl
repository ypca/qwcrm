<!-- details_note_block.tpl -->
<table class="olotable" border="0" width="100%" cellpadding="0" cellspacing="0" >
    <tr>
        <td class="olohead">
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td class="menuhead2" width="80%">&nbsp;{t}Notes{/t}</td>
                    <td class="menuhead2" width="20%" align="right">
                        <table cellpadding="2" cellspacing="2" border="0">
                            <tr> 
                                <td width="33%" align="right">   
                                    <a href="index.php?page=workorder:note_new&workorder_id={$workorder_id}">
                                        <img src="{$theme_images_dir}icons/16x16/small_new_work_order.gif" border="0" onMouseOver="ddrivetip('{t}Click to create a new note{/t}');" onMouseOut="hideddrivetip();">
                                    </a>                    
                                </td>  
                            </tr>
                        </table>
                        </a>
                    </td>
                </tr>
            </table>       
        </td>
    </tr>   
    <tr>
        <td class="menutd">
            <table width="100%" cellpadding="4" cellspacing="0" border="0">
                {section name=n loop=$workorder_notes}
                    <tr>
                        <td class="menutd">
                            <table width="100%" cellpadding="4" cellspacing="0" style="border-collapse: collapse;">                
                                <tr style="border: 1px black solid; background-color: #ededed;">
                                    <td><b>{t}Workorder Note ID{/t}: {$workorder_notes[n].WORK_ORDER_NOTES_ID}</b></td>
                                    <td width="33%" align="right">
                                        {if $login_usergroup_id == 1}
                                            <a href="index.php?page=workorder:note_edit&workorder_note_id={$workorder_notes[n].WORK_ORDER_NOTES_ID}">
                                                <img src="{$theme_images_dir}icons/16x16/small_edit.gif" onMouseOver="ddrivetip('{t}Edit the Note{/t}');" onMouseOut="hideddrivetip();">                                                 
                                            </a>
                                            <a href="index.php?page=workorder:note_delete&workorder_note_id={$workorder_notes[n].WORK_ORDER_NOTES_ID}" onClick="return confirmDelete('{t}Are you sure you want to delete this note?{/t}');">
                                                <img src="{$theme_images_dir}icons/16x16/small_edit.gif" onMouseOver="ddrivetip('{t}Delete the Note{/t}');" onMouseOut="hideddrivetip();">                                                 
                                            </a>
                                        {/if}
                                    </td>
                                </tr>                                
                            </table>    
                        </td>    
                    </tr> 
                    <tr>                    
                        <td>
                            <b>{t}Employee{/t}: </b>{$workorder_notes[n].EMPLOYEE_DISPLAY_NAME}<br>                           
                            <b>{t}Date{/t}: </b>{$workorder_notes[n].WORK_ORDER_NOTES_DATE|date_format:$date_format}<br>
                            <b>{t}Time{/t}: </b>{$workorder_notes[n].WORK_ORDER_NOTES_DATE|date_format:"%H:%M"}<br>
                            <b>{t}Notes{/t}:</b>
                            <div>{$workorder_notes[n].WORK_ORDER_NOTES_DESCRIPTION}<br></div>
                        </td>
                    </tr>
                {/section}
            </table>                            
        </td>          
    </tr>
</table>
