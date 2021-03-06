<!-- note_new.tpl -->
{*
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
*}
<script src="{$theme_js_dir}tinymce/tinymce.min.js"></script>
<script>{include file="`$theme_js_dir_finc`editor-config.js"}</script>

<table width="100%" border="0" cellpadding="20" cellspacing="0">
    <tr>
        <td>
            <table width="700" cellpadding="5" cellspacing="0" border="0">
                <tr>
                    <td class="menuhead2" width="80%">&nbsp;{t}New Note{/t}</td>
                    <td class="menuhead2" width="20%" align="right" valign="middle">
                        <img src="{$theme_images_dir}icons/16x16/help.gif" border="0" onMouseOver="ddrivetip('<div><strong>{t escape=tooltip}CLIENT_NOTE_NEW_HELP_TITLE{/t}</strong></div><hr><div>{t escape=tooltip}CLIENT_NOTE_NEW_HELP_CONTENT{/t}</div>');" onMouseOut="hideddrivetip();">
                    </td>
                </tr>                
                <tr>
                    <td class="menutd2" colspan="2">                        
                        <table width="100%" class="olotable" cellpadding="5" cellspacing="0" border="0" >
                            <tr>
                                <td width="100%" valign="top" >                                  
                                    <form method="post" action="index.php?component=client&page_tpl=note_new&client_id={$client_id}">                                        
                                        <table class="olotable" width="100%" border="0">
                                            <tr>
                                                <td class="olohead"></td>
                                            </tr>
                                            <tr>
                                                <td class="olotd"><textarea name="note" class="olotd4 mceCheckForContent" rows="15" cols="70"></textarea></td>
                                            </tr>
                                        </table>
                                        <br>
                                        <button type="submit" name="submit" value="submit">{t}Submit{/t}</button>
                                        <button type="button" class="olotd4" onclick="window.location.href='index.php?component=client&page_tpl=details&client_id={$client_id}';">{t}Cancel{/t}</button>
                                    </form>
                                    <br>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>