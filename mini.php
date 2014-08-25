<?php

namespace Intaro\HStoreBundle\HStore;

use Intaro\HStoreBundle\HStore\Exception\ConversionException;

class HStoreParser
{
    private function charAfterSpaces($str, &$p)
    {
        $p += strspn($str, " \t\r\n", $p);

        return substr($str, $p, 1);
    }
}
