<?php
//
// Created on: <12-Jun-2002 16:25:40 bf>
//
// SOFTWARE NAME: eZ Publish
// SOFTWARE RELEASE: 4.0.1
// BUILD VERSION: 22260
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
//

/*!
  \class eZContentObjectTranslation ezcontentobjecttranslation.php
  \brief eZContentObjectTranslation handles translation a translation of content objects
  \ingroup eZKernel

  \sa eZContentObject eZContentObjectVersion eZContentObjectTranslation
*/

class eZContentObjectTranslation
{
    function eZContentObjectTranslation( $contentObjectID, $version, $languageCode )
    {
        $this->ContentObjectID = $contentObjectID;
        $this->Version = $version;
        $this->LanguageCode = $languageCode;
        $this->Locale = null;
    }

    function languageCode()
    {
        return $this->LanguageCode;
    }

    function attributes()
    {
        return array( 'contentobject_id',
                      'version',
                      'language_code',
                      'locale' );
    }

    function hasAttribute( $attribute )
    {
        return in_array( $attribute, $this->attributes() );
    }

    function attribute( $attribute )
    {
        if ( $attribute == 'contentobject_id' )
            return $this->ContentObjectID;
        else if ( $attribute == 'version' )
            return $this->Version;
        else if ( $attribute == 'language_code' )
            return $this->LanguageCode;
        else if ( $attribute == 'locale' )
            return $this->locale();
        else
        {
            eZDebug::writeError( "Attribute '$attribute' does not exist", 'eZContentObjectTranslation::attribute' );
            return null;
        }
    }

    function locale()
    {
        if ( $this->Locale !== null )
            return $this->Locale;
        //include_once( 'lib/ezlocale/classes/ezlocale.php' );
        $this->Locale = eZLocale::instance( $this->LanguageCode );
        return $this->Locale;
    }

    /*!
     Returns the attributes for the current content object translation.
    */
    function objectAttributes( $asObject = true )
    {
        return eZContentObjectVersion::fetchAttributes( $this->Version, $this->ContentObjectID, $this->LanguageCode, $asObject );
    }

    /// The content object identifier
    public $ContentObjectID;
    /// Contains the content object
    public $Version;

    /// Contains the language code for the current translation
    public $LanguageCode;
}
?>
