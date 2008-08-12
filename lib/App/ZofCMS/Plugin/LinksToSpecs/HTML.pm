package App::ZofCMS::Plugin::LinksToSpecs::HTML;

use warnings;
use strict;

our $VERSION = '0.0101';

sub new { bless {}, shift }

sub process {
    my ( $self, $template ) = @_;

    my %html_els = (
        'big'
        => q|http://www.w3.org/TR/html401/present/graphics.html#edef-BIG|,

        'select'
        => q|http://www.w3.org/TR/html401/interact/forms.html#edef-SELECT|,

        'frameset'
        => q|http://www.w3.org/TR/html401/present/frames.html#edef-FRAMESET|,

        'base'
        => q|http://www.w3.org/TR/html401/struct/links.html#edef-BASE|,

        'table'
        => q|http://www.w3.org/TR/html401/struct/tables.html#edef-TABLE|,

        'tbody'
        => q|http://www.w3.org/TR/html401/struct/tables.html#edef-TBODY|,

        'font'
        => q|http://www.w3.org/TR/html401/present/graphics.html#edef-FONT|,

        'h5'
        => q|http://www.w3.org/TR/html401/struct/global.html#edef-H5|,

        'map'
        => q|http://www.w3.org/TR/html401/struct/objects.html#edef-MAP|,

        'hr'
        => q|http://www.w3.org/TR/html401/present/graphics.html#edef-HR|,

        'legend'
        => q|http://www.w3.org/TR/html401/interact/forms.html#edef-LEGEND|,

        'strong'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-STRONG|,

        'acronym'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-ACRONYM|,

        'th'
        => q|http://www.w3.org/TR/html401/struct/tables.html#edef-TH|,

        'label'
        => q|http://www.w3.org/TR/html401/interact/forms.html#edef-LABEL|,

        'applet'
        => q|http://www.w3.org/TR/html401/struct/objects.html#edef-APPLET|,

        'h4'
        => q|http://www.w3.org/TR/html401/struct/global.html#edef-H4|,

        'tr'
        => q|http://www.w3.org/TR/html401/struct/tables.html#edef-TR|,

        'td'
        => q|http://www.w3.org/TR/html401/struct/tables.html#edef-TD|,

        'link'
        => q|http://www.w3.org/TR/html401/struct/links.html#edef-LINK|,

        'dfn'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-DFN|,

        'param'
        => q|http://www.w3.org/TR/html401/struct/objects.html#edef-PARAM|,

        'h1'
        => q|http://www.w3.org/TR/html401/struct/global.html#edef-H1|,

        'i'
        => q|http://www.w3.org/TR/html401/present/graphics.html#edef-I|,

        'strike'
        => q|http://www.w3.org/TR/html401/present/graphics.html#edef-STRIKE|,

        'title'
        => q|http://www.w3.org/TR/html401/struct/global.html#edef-TITLE|,

        'body'
        => q|http://www.w3.org/TR/html401/struct/global.html#edef-BODY|,

        'caption'
        => q|http://www.w3.org/TR/html401/struct/tables.html#edef-CAPTION|,

        'ins'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-ins|,

        'q'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-Q|,

        'basefont'
        => q|http://www.w3.org/TR/html401/present/graphics.html#edef-BASEFONT|,

        'tfoot'
        => q|http://www.w3.org/TR/html401/struct/tables.html#edef-TFOOT|,

        'span'
        => q|http://www.w3.org/TR/html401/struct/global.html#edef-SPAN|,

        'html'
        => q|http://www.w3.org/TR/html401/struct/global.html#edef-HTML|,

        'samp'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-SAMP|,

        'tt'
        => q|http://www.w3.org/TR/html401/present/graphics.html#edef-TT|,

        'script'
        => q|http://www.w3.org/TR/html401/interact/scripts.html#edef-SCRIPT|,

        'dir'
        => q|http://www.w3.org/TR/html401/struct/lists.html#edef-DIR|,

        'h3'
        => q|http://www.w3.org/TR/html401/struct/global.html#edef-H3|,

        'textarea'
        => q|http://www.w3.org/TR/html401/interact/forms.html#edef-TEXTAREA|,

        'kbd'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-KBD|,

        'thead'
        => q|http://www.w3.org/TR/html401/struct/tables.html#edef-THEAD|,

        'u'
        => q|http://www.w3.org/TR/html401/present/graphics.html#edef-U|,

        'iframe'
        => q|http://www.w3.org/TR/html401/present/frames.html#edef-IFRAME|,

        'del'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-del|,

        'input'
        => q|http://www.w3.org/TR/html401/interact/forms.html#edef-INPUT|,

        'menu'
        => q|http://www.w3.org/TR/html401/struct/lists.html#edef-MENU|,

        'form'
        => q|http://www.w3.org/TR/html401/interact/forms.html#edef-FORM|,

        'button'
        => q|http://www.w3.org/TR/html401/interact/forms.html#edef-BUTTON|,

        'br'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-BR|,

        'sub'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-SUB|,

        'div'
        => q|http://www.w3.org/TR/html401/struct/global.html#edef-DIV|,

        'noscript'
        => q|http://www.w3.org/TR/html401/interact/scripts.html#edef-NOSCRIPT|,

        'style'
        => q|http://www.w3.org/TR/html401/present/styles.html#adef-style|,

        'isindex'
        => q|http://www.w3.org/TR/html401/interact/forms.html#edef-ISINDEX|,

        's'
        => q|http://www.w3.org/TR/html401/present/graphics.html#edef-S|,

        'var'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-VAR|,

        'center'
        => q|http://www.w3.org/TR/html401/present/graphics.html#edef-CENTER|,

        'frame'
        => q|http://www.w3.org/TR/html401/present/frames.html#edef-FRAME|,

        'dd'
        => q|http://www.w3.org/TR/html401/struct/lists.html#edef-DD|,

        'img'
        => q|http://www.w3.org/TR/html401/struct/objects.html#edef-IMG|,

        'object'
        => q|http://www.w3.org/TR/html401/struct/objects.html#edef-OBJECT|,

        'class'
        => q|http://www.w3.org/TR/html401/struct/global.html#h-7.5.2|,

        'bdo'
        => q|http://www.w3.org/TR/html401/struct/dirlang.html#edef-BDO|,

        'b'
        => q|http://www.w3.org/TR/html401/present/graphics.html#edef-B|,

        'sup'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-SUP|,

        'small'
        => q|http://www.w3.org/TR/html401/present/graphics.html#edef-SMALL|,

        'ul'
        => q|http://www.w3.org/TR/html401/struct/lists.html#edef-UL|,

        'p'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-P|,

        'fieldset'
        => q|http://www.w3.org/TR/html401/interact/forms.html#edef-FIELDSET|,

        'code'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-CODE|,

        'col'
        => q|http://www.w3.org/TR/html401/struct/tables.html#edef-COL|,

        'pre'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-PRE|,

        'colgroup'
        => q|http://www.w3.org/TR/html401/struct/tables.html#edef-COLGROUP|,

        'abbr'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-ABBR|,

        'h6'
        => q|http://www.w3.org/TR/html401/struct/global.html#edef-H6|,

        'li'
        => q|http://www.w3.org/TR/html401/struct/lists.html#edef-LI|,

        'option'
        => q|http://www.w3.org/TR/html401/interact/forms.html#edef-OPTION|,

        'blockquote'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-BLOCKQUOTE|,

        'em'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-EM|,

        'h2'
        => q|http://www.w3.org/TR/html401/struct/global.html#edef-H2|,

        'dt'
        => q|http://www.w3.org/TR/html401/struct/lists.html#edef-DT|,

        'meta'
        => q|http://www.w3.org/TR/html401/struct/global.html#edef-META|,

        'head'
        => q|http://www.w3.org/TR/html401/struct/global.html#edef-HEAD|,

        'noframes'
        => q|http://www.w3.org/TR/html401/present/frames.html#edef-NOFRAMES|,

        'dl'
        => q|http://www.w3.org/TR/html401/struct/lists.html#edef-DL|,

        'ol'
        => q|http://www.w3.org/TR/html401/struct/lists.html#edef-OL|,

        'optgroup'
        => q|http://www.w3.org/TR/html401/interact/forms.html#edef-OPTGROUP|,

        'a'
        => q|http://www.w3.org/TR/html401/struct/links.html#edef-A|,

        'cite'
        => q|http://www.w3.org/TR/html401/struct/text.html#edef-CITE|,

        'address'
        => q|http://www.w3.org/TR/html401/struct/global.html#edef-ADDRESS|,
    );

    keys %html_els;
    while ( my ( $el, $link ) = each %html_els ) {
        my $link_start
        = qq|<a href="$link" title="HTML Specification: '&lt;$el&gt;\' element">|;
        @{ $template->{t} }{
            "html_$el",
            "html_${el}_e",
            "html_${el}_c",
            "html_${el}_ce",
        } = (
            $link_start . qq|<code>&lt;$el&gt;</code></a>|,
            $link_start . qq|<code>&lt;$el&gt;</code> element</a>|,
            $link_start . qq|&lt;$el&gt;</a>|,
            $link_start . qq|&lt;$el&gt; element</a>|,
        );
    }

    return 1;
}

1;
__END__

=head1 NAME

App::ZofCMS::Plugin::LinksToSpecs::HTML - easily include links to elements in HTML 4.01 specification

=head1 SYNOPSIS

In your ZofCMS template:

    plugins => [ qw/LinksToSpecs::HTML/ ],

In your L<HTML::Template> template:

    See: <tmpl_var name="html_div"> for div element<br>
    See: <tmpl_var name="html_blockquote"> for blockquote element<br>
    <tmpl_var name="html_a_ce"> is used for links.

=head1 DESCRIPTION

The module is a plugin for ZofCMS which allows you to easily link to
HTML elements in HTML 4.01 specification. Personally, I use it when writing
my tutorials, hopefully it will be useful to someone else as well.

=head1 ZofCMS TEMPLATE

    plugins => [ qw/LinksToSpecs::HTML/ ],

The only thing you'd need in your ZofCMS template is to add the plugin
into the list of plugins to execute.

=head1 HTML::Template TEMPLATE

    See: <tmpl_var name="html_div"> for div element<br>
    See: <tmpl_var name="html_blockquote"> for blockquote element<br>
    <tmpl_var name="html_a_ce"> is used for links.

To include links to HTML elements in your HTML code you'd use
C<< <tmpl_var name=""> >>. The plugin provides four "styles" of links which
are presented below. The C<EL> stands for any HTML element specified in
HTML 4.01 specification, C<LINK> stands for the link pointing to the
explaination of the given element in HTML specification. B<Note:>
everything needs to be lowercased:

    <tmpl_var name="html_EL">
    <a href="LINK" title="HTML Specification: '&amp;lt;EL&amp;gt;' element"><code>&amp;lt;EL&amp;gt;</code></a>

    <tmpl_var name="html_EL_e">
    <a href="LINK" title="HTML Specification: '&amp;lt;EL&amp;gt;' element"><code>&amp;lt;EL&amp;gt;</code> element</a>

    <tmpl_var name="html_EL_c">
    <a href="LINK" title="HTML Specification: '&amp;lt;EL&amp;gt;' element">&amp;lt;EL&amp;gt;</a>

    <tmpl_var name="html_EL_ce">
    <a href="LINK" title="HTML Specification: '&amp;lt;EL&amp;gt;' element">&amp;lt;EL&amp;gt; element</a>

=head1 SEE ALSO

L<http://www.w3.org/TR/html4/>

=head1 AUTHOR

Zoffix Znet, C<< <zoffix at cpan.org> >>
(L<http://zoffix.com>, L<http://haslayout.net>)

=head1 BUGS

Please report any bugs or feature requests to C<bug-app-zofcms-plugin-linkstospecs-html at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=App-ZofCMS-Plugin-LinksToSpecs-HTML>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc App::ZofCMS::Plugin::LinksToSpecs::HTML

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=App-ZofCMS-Plugin-LinksToSpecs-HTML>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/App-ZofCMS-Plugin-LinksToSpecs-HTML>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/App-ZofCMS-Plugin-LinksToSpecs-HTML>

=item * Search CPAN

L<http://search.cpan.org/dist/App-ZofCMS-Plugin-LinksToSpecs-HTML>

=back

=head1 COPYRIGHT & LICENSE

Copyright 2008 Zoffix Znet, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

