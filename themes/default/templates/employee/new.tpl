<!-- new.tpl -->
<table width="100%" border="0" cellpadding="20" cellspacing="0">
    <tr>
        <td>
            <table width="700" cellpadding="5" cellspacing="0" border="0">
                <tr>
                    <td class="menuhead2" width="80%">&nbsp;{$translate_employee_add_new_employee}</td>
                </tr>
                <tr>
                    <td class="menutd2">
                        <table width="100%" class="olotable" cellpadding="5" cellspacing="0" border="0">
                            <tr>
                                <td width="100%" valign="top">                                 
                                    {literal}
                                    <form action="?page=employee:new" method="POST" name="new_employee" id="edit_employee" onsubmit="return confirmPasswordsMatch();">
                                    {/literal}
                                        <table class="menutable" width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="menutd">
                                                    <table width="100%" cellpadding="2" cellspacing="2" border="0" class="menutd2">
                                                        <tr>
                                                            <td>                                                                
                                                                <table class="olotable" width="100%" cellpadding="5" cellspacing="0" border="0">
                                                                    <tr class="row2">
                                                                        <td class="menuhead" colspan="3" width="100%">&nbsp;{$translate_employee_contact_information}</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left">
                                                                            <table>
                                                                                <tbody align="left">
                                                                                    <tr>
                                                                                        <td align="right"><strong>{$translate_employee_display_name}</strong><span style="color: #ff0000">*</span></td>
                                                                                        <td><input name="employee_displayName" class="olotd5" value="{$employee_displayName}" type="text" maxlength="20" required onkeydown="return onlyAlpha(event);"></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right"><strong>{$translate_employee_first_name}</strong><span style="color: #ff0000">*</span></td>
                                                                                        <td><input name="employee_firstName" class="olotd5" value="{$employee_firstName}" type="text" maxlength="20" required onkeydown="return onlyAlpha(event);"></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right"><strong>{$translate_employee_last_name}</strong><span style="color: #ff0000">*</span></td>
                                                                                        <td><input name="employee_lastName" class="olotd5" value="{$employee_lastName}" type="text" maxlength="20" required onkeydown="return onlyAlpha(event);"></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right"><strong>{$translate_employee_email_address}</strong><span style="color: #ff0000">*</span></td>
                                                                                        <td><input name="employee_email" class="olotd5" size="50" value="{$employee_email}" type="email" maxlength="50" required onkeydown="return onlyEmail(event);"></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right"><strong>{$translate_employee_type}</strong></td>
                                                                                        <td>                                                                                            
                                                                                            <select name="employee_type" class="olotd5" value="{$employee_type}">
                                                                                                <option value="1">Administrator</option>
                                                                                                <option value="2">{$translate_employee_manager}</option>
                                                                                                <option value="3">{$translate_employee_supervisor}</option>
                                                                                                <option value="4" selected>Technician</option>
                                                                                                <option value="5">Clerical</option>
                                                                                                <option value="6">Counter</option>
                                                                                                <option value="7">Customer</option>
                                                                                                <option value="8">Guest</option>
                                                                                                <option value="9">Public</option>
                                                                                            </select>                                                                                            
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td colspan="1" align="right"><b>Active</b></td>
                                                                                        <td>
                                                                                            <select name="employee_status" class="olotd5" value="{$employee_status}">
                                                                                                <option value="0">No</option>
                                                                                                <option value="1" selected>Yes</option>
                                                                                            </select>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right"><strong>{$translate_employee_login_id}</strong><span style="color: #ff0000">*</span></td>
                                                                                        <td><input name="employee_usr" class="olotd5" value="{$employee_usr}" type="text" maxlength="20" required onkeydown="return onlyUsername(event);"></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right"><strong>{$translate_employee_password}</strong></td>
                                                                                        <td><input id="password" name="employee_pwd" class="olotd5" value="{$employee_pwd}" type="password" maxlength="20" required onkeydown="return onlyPassword(event);"></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right"><strong>{$translate_employee_password_confirm}</strong></td>
                                                                                        <td>
                                                                                            <input id="confirmPassword" name="confirmPassword" class="olotd5" value="{$employee_pwd}" type="password" maxlength="20" required onkeyup="checkPasswordsMatch('{$translate_core_theme_passwords_match}', '{$translate_core_theme_passwords_do_not_match}');" onkeydown="return onlyPassword(event);">
                                                                                            <div id="passwordMessage" style="min-height: 5px;"></div>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr class="row2">
                                                                        <td class="menuhead" colspan="2">&nbsp;{$translate_employee_phone_numbers}</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" align="left">
                                                                            <table>
                                                                                <tr>
                                                                                    <td align="right"><strong>{$translate_employee_home_phone_number}</strong></td>
                                                                                    <td><input name="employee_homePhone" class="olotd5" value="{$employee_homePhone}" type="tel" maxlength="20" onkeydown="return onlyPhoneNumber(event);"></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right"><strong>{$translate_employee_work_phone_number}</strong></td>
                                                                                    <td><input name="employee_workPhone" class="olotd5" value="{$employee_workPhone}" type="tel" maxlength="20" onkeydown="return onlyPhoneNumber(event);"></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right"><strong>{$translate_employee_mobile_phone_number}</strong></td>
                                                                                    <td><input name="employee_mobilePhone" class="olotd5" value="{$employee_mobilePhone}" type="tel" maxlength="20" onkeydown="return onlyPhoneNumber(event);"></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr class="row2">
                                                                        <td class="menuhead" colspan="2">&nbsp;{$translate_employee_address}</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3">
                                                                            <table>
                                                                                <tbody align="left">
                                                                                    <tr>
                                                                                        <td valign="top" align="right"><strong>{$translate_employee_address}</strong></td>
                                                                                        <td><textarea name="employee_address" class="olotd5" cols="30" rows="3" maxlength="100" onkeydown="return onlyAddress(event);">{$employee_address}</textarea></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right"><strong>{$translate_employee_city}</strong></td>
                                                                                        <td><input name="employee_city" class="olotd5" value="{$employee_city}" type="text" maxlength="20" onkeydown="return onlyAlpha(event);"></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right"><strong>{$translate_employee_state}</strong></td>
                                                                                        <td><input name="employee_state" class="olotd5" value="{$employee_state}" type="text" maxlength="20" onkeydown="return onlyAlpha(event);"></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right"><strong>{$translate_employee_zip}</strong></td>
                                                                                        <td ><input name="employee_zip" class="olotd5" value="{$employee_zip}" type="text" maxlength="20" onkeydown="return onlyAlphaNumeric(event);"></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td colspan="3">
                                                                                            <strong>{$translate_employee_based}&nbsp&nbsp</strong>
                                                                                            <select name="employee_based" class="olotd5" value="{$employee_based}">                                                                                                
                                                                                                <option value="0" selected>Office</option>
                                                                                                <option value="1">Home</option>
                                                                                                <option value="2">OnSite</option>
                                                                                            </select>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2"><input name="submit" class="olotd5" value="{$translate_employee_submit}" type="submit"></td>
                                                                    </tr>                                                                    
                                                                </table>                                                                
                                                            </td>
                                                    </table>
                                                </td>
                                        </table>
                                    </form>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>