<?php
/**
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
 */

/* 
 * i am going to use this to hold all security related functions for easy reference
 * some code will auto run aswell as functions being here almost like a seperate library
 */

// Force SSL/HTTPS if enabled - add base path stuff here
if($force_ssl == 1 && !isset($_SERVER['HTTPS'])){
    header('Location: https://' . QWCRM_DOMAIN . QWCRM_PATH );
}