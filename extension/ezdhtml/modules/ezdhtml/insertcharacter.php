<?php
//
//
// SOFTWARE NAME: eZ Online Editor
// COPYRIGHT NOTICE: Copyright (C) 1999-2008 eZ Systems AS
// SOFTWARE LICENSE: GNU General Public License v2.0
// NOTICE: >
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of version 2.0  of the GNU General
//   Public License as published by the Free Software Foundation.
//
//   This program is distributed in the hope that it will be useful,
//   but WITHOUT ANY WARRANTY; without even the implied warranty of
//   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//   GNU General Public License for more details.
//
//   You should have received a copy of version 2.0 of the GNU General
//   Public License along with this program; if not, write to the Free
//   Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
//   MA 02110-1301, USA.
//

require_once( "kernel/common/template.php" );

$Module = $Params["Module"];
$http = eZHTTPTool::instance();

$Module->setTitle( "Insert special chararter" );

$tpl = templateInit();
$tpl->setVariable( "module", $Module );

$iniEzdhtml = eZINI::instance( 'ezdhtml.ini' );
$chars = $iniEzdhtml->variable( 'SpecialCharacterSettings', 'Chars' );

$tpl->setVariable( "chars", $chars );

$Result = array();
$userAgent = eZSys::serverVariable( 'HTTP_USER_AGENT' );
if ( preg_match ("/gecko/i", $userAgent ) )
{
    $Result['content'] = $tpl->fetch( "design:ezdhtml/insertcharacter_gecko.tpl" );
}
else
{
    $Result['content'] = $tpl->fetch( "design:ezdhtml/insertcharacter.tpl" );
}
$Result['path'] = array( array( 'url' => '/ezdhtml/insertcharacter/',
                                'text' => 'Insert special character' ) );
?>
