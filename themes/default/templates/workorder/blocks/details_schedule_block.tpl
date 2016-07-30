<!-- details_schedule_block.tpl - Display Work Order Schedule (Work Orders - Details Page) -->
<table class="olotable" width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="olohead">
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td class="menuhead2" width="80%">&nbsp;{$translate_workorder_details_schedule_title}</td>
                    <td class="menuhead2" width="20%" align="right">
                        <table cellpadding="2" cellspacing="2" border="0">
                            <tr>
                                <td width="33%" align="right" >
                                    <a>
                                        <img src="{$theme_images_dir}icons/16x16/small_new_work_order.gif" border="0"
                                            onMouseOver="ddrivetip('{$translate_workorder_details_schedule_button_tooltip}');"
                                            onMouseOut="hideddrivetip();">
                                    </a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>    
        </td>
    </tr><tr>
        <td class="menutd">
            <table width="100%" cellpadding="4" cellspacing="0">
                <tr>
                    <td>
                        {section name=e loop=$workorder_schedule}
                            <b>{$translate_workorder_start} </b>{$workorder_schedule[e].SCHEDULE_START|date_format:"$date_format %I:%M  %p"} <b>- {$translate_workorder_end} </b> {$workorder_schedule[e].SCHEDULE_END|date_format:"$date_formatS %I:%M  %p "} <br>
                            <b>{$translate_workorder_notes}</b><br>
                            {$workorder_schedule[e].SCHEDULE_NOTES}
                        {sectionelse}
                            <table class="olotablered" width="100%" border="0" cellpadding="5" cellspacing="0">
                                <tr>
                                    <td>
                                        <span class="error_font">{$translate_workorder_warning}: </span> {$translate_workorder_msg_no_schedule_has_been_set}
                                    </td>
                                </tr>
                            </table>    
                        {/section}
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td height="81"  align="center" >
                                    <div id="calendar-container"></div>
                                    <link rel="stylesheet" type="text/css" media="all" href="includes/jscalendar/calendar-blue.css" title="win2k-1" />
                                    <script type="text/javascript" src="includes/jscalendar/calendar_stripped.js"></script>
                                    <script type="text/javascript" src="includes/jscalendar/lang/calendar-english.js"></script>
                                    <script type="text/javascript" src="includes/jscalendar/calendar-setup_stripped.js"></script>
                                    {literal}
                                    <script type="text/javascript">
                                        function dateChanged(calendar) {
                                            // Beware that this function is called even if the end-user only
                                            // changed the month/year.  In order to determine if a date was
                                            // clicked you can use the dateClicked property of the calendar:
                                            if (calendar.dateClicked) {
                                                // OK, a date was clicked, redirect to /yyyy/mm/dd/index.php
                                                var y = calendar.date.getFullYear();
                                                var M = calendar.date.getMonth();  
                                                var m = M + 1;   // integer, 0..11
                                                var d = calendar.date.getDate();      // integer, 1..31
                                                // redirect...
                                                window.location =  "?page=schedule:main&y="+y+"&m="+m+"&d="+d+"&wo_id={/literal}{$wo_id}{literal}&page_title={/literal}{$translate_workorder_schedule}{literal}";
                                            }
                                        };
                                         Calendar.setup(
                                            {
                                            flat: "calendar-container",
                                            showothers: true,
                                            flatCallback : dateChanged
                                            }
                                        );
                                    </script>
                                    {/literal}
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br>
        </td>
    </tr>
</table>