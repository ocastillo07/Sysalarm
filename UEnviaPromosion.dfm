object frmEnviaPromosion: TfrmEnviaPromosion
  Left = 204
  Top = 166
  Width = 504
  Height = 350
  Caption = 'Envia Promosion'
  Color = clNavy
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel1: TRzLabel
    Left = 8
    Top = 16
    Width = 44
    Height = 13
    Caption = 'Asunto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel2: TRzLabel
    Left = 8
    Top = 40
    Width = 107
    Height = 13
    Caption = 'Cuerpo del Correo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel3: TRzLabel
    Left = 8
    Top = 136
    Width = 54
    Height = 13
    Caption = 'Adjuntos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel4: TRzLabel
    Left = 336
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Correos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object btnenviar: TRzBitBtn
    Left = 8
    Top = 278
    Width = 313
    Height = 33
    FrameColor = 7617536
    Caption = '&Enviar Correo'
    Color = 15791348
    HotTrack = True
    TabOrder = 0
    OnClick = btnenviarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000730E0000730E00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8815656565656
      565656565656565656568181818181818181818181818181818181D6D6D6D6D6
      D6D6D6D6D6D6D6D6D65681E8E8E8E8E8E8E8E8E8E8E8E8E8E88181D6D6D6D6D6
      D6D6D6D6D6D6D6D6D65681E8E8E8E8E8E8E8E8E8E8E8E8E8E88181D7D6D60909
      09090909D6D6D6D6D65681D7E8E8818181818181E8E8E8E8E88181D6D7D6D6D6
      D6D6D6D6D6D6D6D6D65681E8D7E8E8E8E8E8E8E8E8E8E8E8E88181D7D7D60909
      09090909D6D6D6D6D65681D7D7E8818181818181E8E8E8E8E88181D7D6D7D6D6
      D6D6D6D6D6D6D6D6D65681D7E8D7E8E8E8E8E8E8E8E8E8E8E88181D7D7D6D7D6
      D6D6D6D6D6D6906CD65681D7D7E8D7E8E8E8E8E8E8E88181E88181D7D7D7D7D6
      D6D6D6D6D6D6B690D65681D7D7D7D7E8E8E8E8E8E8E88181E88181D7D7D7D6D7
      D6D6D6D6D6D6D6D6D65681D7D7D7E8D7E8E8E8E8E8E8E8E8E881818181818181
      8181818181818181818181818181818181818181818181818181E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object lcorreos: TRzListBox
    Left = 336
    Top = 24
    Width = 153
    Height = 201
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 13
    Items.Strings = (
      'eduardomtz@alarmex.com.mx'
      'jgutierrez@alarmex.com'
      'fabiola@tbmcarriers.com'
      'josev@tbmcarriers.com'
      'rolando@tbmcarriers.com'
      'gerardo@tbmcarriers.com'
      'amascareno@tbmcarriers.com'
      'yanetf@tbmcarriers.com'
      'enrique.herrera@tbmcarrriers.com'
      'egarcia@printersolutions.sh.com.mx'
      'dvilla@printersolutions.sh.com.mx'
      'ivone@ceconsultoria.com'
      'gines@ceconsultoria.com'
      'alejandra@ceconsultoria.com'
      'claudia@ceconsultoria.com'
      'lylyza@ceconsultoria.com'
      'yolandac@ceconsultoria.com'
      'victorq@ceconsultoria.com'
      'danielatellez@ceconsultoria.com'
      'almam@ceconsultoria.com'
      'isaacroman@ceconsultoria.com'
      'rubenl@ceconsultoria.com'
      'lsalazar@ceconsultoria.com'
      'sandrar@ceconsultoria.com'
      'karla_mlc@ceconsultoria.com'
      'macroplaza@etceteraaccesorios.com'
      'rocio@etceteraaccesorios.com'
      'rosella@etceteraaccesorios.com'
      'juventud@etceteraaccesorios.com'
      'jorge@etceteraaccesorios.com'
      'omadrigal@etceteraaccesorios.com'
      'psarabia@etceteraaccesorios.com'
      'carbo@medium.com.mx'
      'mcuburu@medium.com.mx'
      'hey@medium.com.mx'
      'alan@medium.com.mx'
      'truxa@medium.com.mx'
      'yuli@medium.com.mx'
      'mariana@medium.com.mx'
      'mauricio@medium.com.mx'
      'aquintana@polarfreeze.com.mx'
      'acota@polarfreeze.com.mx'
      'hrosales@polarfreeze.com.mx'
      'amatus@polarfreeze.com.mx'
      'mprince@polarfreeze.com.mx'
      'jdiaz@polarfreeze.com.mx'
      'gbarragan@polarfreeze.com.mx'
      'hmartinez@polarfreeze.com.mx'
      'pattyruiz@polarfreeze.com.mx'
      'jor_quintero@reebc.org.mx'
      'castorena@reebc.org.mx'
      'fritz@reebc.org.mx'
      'jpangulo@reebc.org.mx'
      'masaldana@reebc.edu.mx'
      'gadame@reebc.org.mx'
      'jtbenitez@reebc.org.mx'
      'lucia@reebc.org.mx'
      'cesar@reebc.org.mx'
      'dancarranza@reebc.org.mx'
      'sandra@reebc.org.mx'
      'gmeza@reebc.org.mx'
      'eduardo@reebc.org.mx'
      'rcastorena@reebc.org.mx'
      'rreyes@nelson.com.mx'
      'cuentas@visiona360.com'
      'francisco@visiona360.com'
      'arte@visiona360.com'
      'director@visiona360.com'
      'sandra@visiona360.com'
      'anapatricia@casasalfa.com'
      'alex.prieto@casasalfa.com'
      'alvelasco@casasalfa.com'
      'omm@casasalfa.com'
      'armando.gutierrez@casasalfa.com'
      'ana.valenzuela@casasalfa.com'
      'lbravo@casasalfa.com'
      'angelica.aguilar@casasalfa.com'
      'karina.sun@casasalfa.com'
      'sandra.barbara@casasalfa.com'
      'ada.garcia@casasalfa.com'
      'victor.sanchez@casasalfa.com'
      'oscar.salgado@bajaequipos.com'
      'cas@bajaequipos.com'
      'catygonzalez@bajaequipos.com'
      'alfonsocardona@bajaequipos.com'
      'anagonzalez@bajaequipos.com'
      'caf@bajaequipos.com'
      'josemaria.morales@bajaequipos.com'
      'oscarrodriguez@bajaequipos.com'
      'albertocossio@bajaequipos.com'
      'anaatondo@bajaequipos.com'
      'claudia@genesisconsultoria.com'
      'anibal@genesisconsultoria.com'
      'victuro@genesisconsultoria.com'
      'veronica@genesisconsultoria.com'
      'levin.cabrera@genesisconsultoria.com'
      'gretel@genesisconsultoria.com'
      'elizabeth@genesisconsultoria.com'
      'clservin@genesisconsultoria.com'
      'letusknow@garin.com.mx'
      'sgarin@garin.com.mx'
      'sagawe@garin.com.mx'
      'pedroserrano@garin.com.mx'
      'c.martinez@garin.com.mx'
      'francisco.corona@garin.com.mx'
      'erika.rodriguez@garin.com.mx'
      'andres.garcia@garin.com.mx'
      'santiago.garinsr@garin.com.mx'
      'santiago@garin.com.mx'
      'santiago.garinjr@garin.com.mx'
      'santiagojr@garin.com.mx'
      'sergio.garin@garin.com.mx'
      'camelia.verdugo@garin.com.mx'
      'bianca.franco@garin.com.mx'
      'luis.flores@garin.com.mx'
      'merle.topete@garin.com.mx'
      'elizabeth.guerrero@garin.com.mx'
      'alejandro.garcia@garin.com.mx'
      'adolfo.cano@garin.com.mx'
      'arteferro@garin.com.mx'
      'fco.robles@garin.com.mx'
      'guillermina.olea@garin.com.mx'
      'tere.cardenas@garin.com.mx'
      'production@arteferro-fence.com'
      'letusknow@arteferro-fence.com'
      'sgarin@arteferro-fence.com'
      'sagawe@arteferro-fence.com'
      'pedroserrano@arteferro-fence.com'
      'c.martinez@arteferro-fence.com'
      'francisco.corona@arteferro-fence.com'
      'ricardo.cabo@arteferro-fence.com'
      'andres.garcia@arteferro-fence.com'
      'karimtorres@aduanalsica.com'
      'yesenia@aduanalsica.com'
      'octavioa@aduanalsica.com'
      'erick@aduanalsica.com'
      'jkunasich@margarindustrial.com'
      'juliamasanchez@margarincustrial.com'
      'corky@associatesint.com'
      'soportet1@associatesint.com'
      'ernestoruffo@cachanillaambiental.com'
      'karlacarballo@cachanillaambiental.com'
      'leticiasanchez@cachanillaambiental.com'
      'yanetcastillo@cachanillaambiental.com'
      'carmenramirez@cachanillaambiental.com'
      'marcelahardy@cachanillaambiental.com'
      'humbertocampana@cachanillaambiental.com'
      'liliansalgado@dutyworks.com'
      'oscar.salgado@dutyworks.com'
      'empleos@dutyworks.com'
      'joskitrodriguez@dutyworks.com'
      'isabellutz@dutyworks.com'
      'magdanolazco@dutyworks.com'
      'victor.estrada@dutyworks.com'
      'freyes@dutyworks.com'
      'oscar.rodriguez@dutyworks.com'
      'anitzia.lara@dutyworks.com'
      'brenda.paola@dutyworks.com'
      'anahi.hull@dutyworks.com'
      'brenda.avalos@dutyworks.com'
      'lorena.mena@dutyworks.com'
      'jmadrid@uraniorecords.com'
      'arsenal@uraniorecords.com'
      'penumbra@uraniorecords.com'
      'feleo@uraniorecords.com'
      'rblancarte@uraniorecords.com'
      'rmadrid@uraniorecords.com'
      'agarcia@uraniorecords.com'
      'alex@losbuenosmuchachos.com'
      'hector@losbuenosmuchachos.com'
      'tato@losbuenosmuchachos.com'
      'servicios@serviciosdeldesierto.com'
      'aquintana@serviciosdeldesierto.com'
      'rosalesheriberto@suitesjosefina.com'
      'faviola@valderal.com'
      'reyesamendez@deltabev.com'
      'carlosam@futcachanilla.com'
      'sretamoza@futcachanilla.com'
      'publicidad@futcachanilla.com'
      'victorestrada1@bajaequipos.com'
      'heraldez1@medium.com.mx'
      'maritza.velazques@tbmcarriers.com'
      'lily.heinecke@versallesresidencial.com.mx'
      'karla.reyes@versallesresidencial.com.mx'
      'david.ruiz@versallesresidencial.com.mx'
      'karime.lopez@versallesresidencial.com.mx'
      'borrame@solesmexicali.com'
      'rvasquez@solesmxl.com'
      'rvasquez@solesmexicali.com'
      'eacevez@solesmxl.com'
      'eacevez@solesmexicali.com'
      'eaceves@solesmxl.com'
      'eaceves@solesmexicali.com'
      'h17@solesmexicali.com'
      'willy@solesmexicali.com'
      'zochoa@solesmexicali.com'
      'ahernandez@solesmexicali.com'
      'jduran@solesmexicali.com'
      'quimaro@solesmexicali.com'
      'jaime.inzunza@solesmexicali.com'
      'vcamargo@solesmexicali.com'
      'cavila@solesmexicali.com'
      'prensa@solesmexicali.com'
      'prensa@solesmxl.com'
      'recepcion@solesmxl.com'
      'recepcion@solesmexicali.com'
      'boletos@solesmexicali.com'
      'mmarquez@solesmexicali.com'
      'aestrada@solesmexicali.com'
      'ssantander@solesmexicali.com'
      'maispuro@solesmexicali.com'
      'cluken@solesmexicali.com'
      'ejaramillo@solesmexicali.com'
      'asanchez@solesmexicali.com'
      'moderador@solesmexicali.com'
      'contabilidad@solesmexicali.com'
      'arc@misseguros.com'
      'martha@misseguros.com'
      'javier@gngrowers.com'
      'claudio@gngrowers.com'
      'victuro@gngrowers.com'
      'salvador@gngrowers.com'
      'jnp@gngrowers.com'
      'diana@gngrowers.com'
      'ana@gngrowers.com'
      'jezabel@jezabelfranco.com'
      'raul.cuadras@tbmcarriers.com'
      'contacto@iduarte.com.mx'
      'ivan@iduarte.com.mx'
      'lilia@productosherbalife.com.mx'
      'pedidos@productosherbalife.com.mx'
      'galgos@galgostijuana.com'
      'lily@galgostijuana.com'
      'jtrevino@galgostijuana.com'
      'jjensen@galgostijuana.com'
      'rrodriguez@galgostijuana.com'
      'khill@galgostijuana.com'
      'samaya@galgostijuana.com'
      'rmarentez@galgostijuana.com'
      'kdubois@galgostijuana.com'
      'fpadilla@galgostijuana.com'
      'jharper@galgostijuana.com'
      'vduarte@galgostijuana.com'
      'ginurreta@galgostijuana.com'
      'macosta@galgostijuana.com'
      'fgomez@galgostijuana.com'
      'arodriguez@galgostijuana.com'
      'esther.ramirez@tbmcarriers.com'
      'sguzman@galgostijuana.com'
      'etorres@galgostijuana.com'
      'jrosas@galgostijuana.com'
      'cony@galgostijuana.com'
      'mario@sahuaros.com.mx'
      'karlaz@sahuaros.com.mx'
      'alma@sahuaros.com.mx'
      'cafdaniels@proveeind.com'
      'alan.villarreal@tbmcarriers.com'
      'rarce@solesmexicali.com'
      'borrame@abante.com.mx'
      'adiaz@abante.com.mx'
      'amartinez@abante.com.mx'
      'rdiaz@abante.com.mx'
      'auditores@abante.com.mx'
      'consultores@abante.com.mx'
      'articulos@abante.com.mx'
      'ursula@etceteraaccesorios.com'
      'argentina@etceteraaccesorios.com'
      'karla@etceteraaccesorios.com'
      'minerva_hdez@sahuaros.com.mx'
      'sugei@sahuaros.com.mx'
      'sarah@pesimexicali.com'
      'jacky@pesimexicali.com'
      'monic@pesimexicali.com'
      'servicios@pesimexicali.com'
      'ameans@sorteoscanacintra.com'
      'jmeans@sorteoscanacintra.com'
      'gloriad@sorteoscanacintra.com'
      'jorge@sorteoscanacintra.com'
      'gana@sorteoscanacintra.com'
      'carpinteros@etceteraaccesorios.com'
      'benito@etceteraaccesorios.com'
      'villanova@etceteraaccesorios.com'
      'catavina@etceteraaccesorios.com'
      'santiago.garinsr@arteferro-fence.com'
      'santiago.garinjr@arteferro-fence.com'
      'sergio.garin@arteferro-fence.com'
      'camelia.verdugo@arteferro-fence.com'
      'bianca.franco@arteferro-fence.com'
      'luis.flores@arteferro-fence.com'
      'merle.topete@arteferro-fence.com'
      'elizabeth.guerrero@arteferro-fence.com'
      'alejandro.garcia@arteferro-fence.com'
      'adolfo.cano@arteferro-fence.com'
      'arteferro@arteferro-fence.com'
      'fco.robles@arteferro-fence.com'
      'javier@cpheraldez.com'
      'fvillalobos@cpheraldez.com'
      'apalomino@cpheraldez.com'
      'elanderos@cpheraldez.com'
      'lalvarez@cpheraldez.com'
      'crolon@cpheraldez.com'
      'ntorres@cpheraldez.com'
      'eruiz@cpheraldez.com'
      'lamparano@cpheraldez.com'
      'abernal@cpheraldez.com'
      'asaavedra@cpheraldez.com'
      'fmorales@cpheraldez.com'
      'elopez@cpheraldez.com'
      'gibarra@cpheraldez.com'
      'smedrano@cpheraldez.com'
      'angelica.castro@tbmcarriers.com'
      'sunsound@medium.com.mx'
      'envios@sunsound.com.mx'
      'maltos@sunsound.com.mx'
      'omar@sunsound.com.mx'
      'rodrigo@sunsound.com.mx'
      'cesar@sunsound.com.mx'
      'saidfierro13@sunsound.com.mx'
      'bertha@urbe1-9.com'
      'blanca.contreras@urbe1-9.com'
      'laura.escalante@fundacionperitus.org'
      'alejandra.becerra@fundacionperitus.org'
      'ampr@fundacionperitus.org'
      'contactos@fundacionperitus.org'
      'recepcion@etceteraaccesorios.com'
      'contacto@etceteraaccesorios.com'
      'compras@etceteraaccesorios.com'
      'panchoespinoza@porapec.com'
      'sandra@porapec.com'
      'oscarperalta@porapec.com'
      'oscars@porapec.com'
      'arl@misseguros.com'
      's.villavicencio@gciconstructora.com'
      'v.villavicencio@gciconstructora.com'
      'soko_villa@gciconstructora.com'
      'rosioah@gciconstructora.com'
      'gabycallu@gciconstructora.com'
      'silvia.v@gciconstructora.com'
      'a.zagal@gciconstructora.com'
      'o_villa@gciconstructora.com'
      'l.gaxiola@gciconstructora.com'
      'jmuv@gciconstructora.com'
      'gabby.a@gciconstructora.com'
      'f.uribe@gciconstructora.com'
      'giles@gciconstructora.com'
      'o.leal@gciconstructora.com'
      'yajabuy21@gciconstructora.com'
      'fvega@gciconstructora.com'
      'r.angel@gciconstructora.com'
      'haydee@gciconstructora.com'
      'anuma@gciconstructora.com'
      'aisha@etceteraaccesorios.com'
      'carlos.orozco@tbmcarriers.com'
      'ana.atondo@dutyworks.com'
      'nydia.gutierrez@dutyworks.com'
      'vicente.garcia@dutyworks.com'
      'karla.carballo@dutyworks.com'
      'alfredo.nuno@southunitedneighbors.com'
      'consejo@unicada.com'
      'conagro@unicada.com'
      'alma@casablancasf.com'
      'alfredo@casablancasf.com'
      'minerva@casablancasf.com'
      'mario@casablancasf.com'
      'admin@casabancasf.com'
      'developer@casablancasf.com'
      'notarysupport@casablancasf.com'
      'lorenzo@casablancasf.com'
      'karla@casablancasf.com'
      'vicky@casablancasf.com'
      'margaret@casablancasf.com'
      'marcela@casablancasf.com'
      'horacio@casablancasf.com'
      'russ@casablancasf.com'
      'selene@casablancasf.com'
      'melissa@casablancasf.com'
      'webmaster@blackwoodie.com'
      'soporte@blackwoodie.com'
      'soporte@drpc.com.mx'
      'alejandro@almejo.com'
      'silvia@almejo.com'
      'aquintana@silverbreezei.com'
      'pquintana@silverbreezei.com'
      'jlcruz@silverbreezei.com'
      'icarrillo@silverbreezei.com'
      'javiervlza@polarfreeze.com.mx'
      'direccion@semamarioelpionero.com'
      'administracion@semamarioelpionero.com'
      'tecnico@semamarioelpionero.com'
      'atencion@semamarioelpionero.com'
      'diseno@semamarioelpionero.com'
      'publicidad@semamarioelpionero.com'
      'pionero@semamarioelpionero.com'
      'isabel@serviciosdeldesierto.com'
      'supervision@serviciosdeldesierto.com'
      'webmaster@modelismoaescala.com'
      'presidente@modelismoaescala.com'
      'revista@modelismoaescala.com'
      'neyda.aguilera@dutyworks.com'
      'contacto@lafronteranorte.com'
      'reginaldo@lafronteranorte.com'
      'rosa@lafronteranorte.com'
      'anna@lafronteranorte.com'
      'myriam@integratedbordersolutions.com'
      'rolando.herrera@integratedbordersolutions.com'
      'anna.ramos@tbmcarriers.com'
      'k.garcia@lomstudio.com'
      'd.richkarday@lomstudio.com'
      'admon@lomstudio.com'
      'l.olguin.m@lomstudio.com'
      'juanramon@proshield.com.mx'
      'ramonrobles@proshield.com.mx'
      'planeacionpsh@proshield.com.mx'
      'mxli@casasalfa.com'
      'integracion@casasalfa.com'
      'obra@casasalfa.com'
      'ingmoreno@casasalfa.com'
      'contacto@casasalfa.com'
      'contabilidad@casasalfa.com'
      'sm@casasalfa.com'
      'selene.rivera@casasalfa.com'
      'david.mercado@casasalfa.com'
      'marisela.tarin@casasalfa.com'
      'alejandra.zendejas@casasalfa.com'
      'rodolfo.perez@casasalfa.com'
      'victor.trejo@casasalfa.com'
      'carlos@a360.com.mx'
      'sandra@a360.com.mx'
      'contacto@a360.com.mx'
      'voy@a360.com.mx'
      'teto@a360.com.mx'
      'cesar@a360.com.mx'
      'jgonzalez@tbmcarriers.com'
      'saulm@casasalfa.com'
      'saul.moreno@casasalfa.com'
      'presidencia@amjb.org.mx'
      'secretario@amjb.org.mx'
      'tesorero@amjb.org.mx'
      'capacitacion@amjb.org.mx'
      'sistema@amjb.org.mx'
      'vicepresidencia@amjb.org.mx'
      'administrador@amjb.org.mx'
      'contact@ezooband.com'
      'kiko@ezooband.com'
      'humaran@ezooband.com'
      'linda@ezooband.com'
      'judith.leyva@spaciolevegaleria.com'
      'gregory.lopez@spaciolevegaleria.com'
      'fabiola.corral@spaciolevegaleria.com'
      'direccion@spaciolevegaleria.com'
      'diana.lopez@spaciolevegaleria.com'
      'sergio.padilla@spaciolevegaleria.com'
      'meseros@almejo.com'
      'carlos.cabrera@cubamartini.com'
      'hector.gil@cubamartini.com'
      'jorge.chiang@chiangschinabistro.com'
      'oscar.salgado@chiangschinabistro.com'
      'sergio.cervantes@tbmcarriers.com'
      'modelos@agenciaenlaces.com.mx'
      'carolinarios@agenciaenlaces.com.mx'
      'nadiareynoso@agenciaenlaces.com.mx'
      'abelpuentes@agenciaenlaces.com.mx'
      'geometria@almejo.com'
      'administracion@sanpedroac.com'
      'comite@sanpedroac.com'
      'cobranza@sanpedroac.com'
      'rodrigodiaz@abante.com.mx'
      'mcanez@abante.com.mx'
      'amanda.cervantes@tbmcarriers.com'
      'oscar@cubamartini.com'
      'david@cubamartini.com'
      'rodolfo@cubamartini.com'
      'cristina@cubamartini.com'
      'djpaw@cubamartini.com'
      'ajavalera@cubamartini.com'
      'ealapizco@cubamartini.com'
      'lbobadilla@cubamartini.com'
      'juancarlos@cubamartini.com'
      'melany.martinez@tbmcarriers.com'
      'pituka@fundacionperitus.org'
      'rcarranza@bestchoicemx.com'
      'tcarranza@bestchoicemx.com'
      'pgarcia@bestchoicemx.com'
      'jcastillo@bestchoicemx.com'
      'tfimbres@bestchoicemx.com'
      'ccarranza@bestchoicemx.com'
      'lgarcia@bestchoicemx.com'
      'raul.meza@tbmcarriers.com'
      'luis.caballero@inbursamexicali.com'
      'aguilar.humberto@inbursamexicali.com'
      'ghiselle.ruvalcaba@inbursamexicali.com'
      'maryosuna@inbursamexicali.com'
      'diana.gonzalez@inbursamexicali.com'
      'martha.gomez@inbursamexicali.com'
      'armando.garcia@inbursamexicali.com'
      'anitzia.lara@chiangschinabistro.com'
      'miguel.cetto@spaciolevegaleria.com'
      'ali@sunsound.com.mx'
      'josei.monge@casasalfa.com'
      'davidpereda@coloradosdesanluis.com'
      'lorenamena@coloradosdesanluis.com'
      'carloshdominguez@coloradosdesanluis.com'
      'victordelbarba@coloradosdesanluis.com'
      'alfredo.velasco@casasalfa.com'
      'veronica@vjfrescodelnorte.com'
      'sv@vjfrescodelnorte.com'
      'omedina@vjfrescodelnorte.com'
      'mariol@vjfrescodelnorte.com'
      'ccastro@vjfrescodelnorte.com'
      'losvintage@mauriciocuburu.com'
      'manuel@gastroind.com'
      'hector.ibarra@gastroind.com'
      'ignacio.gomez@gastroind.com'
      'yolandap@vjfrescodelnorte.com'
      'diana.garcia@inbursamexicali.com'
      'marcoledezma@bandacachanilla.com'
      'jmadrid@bandacachanilla.com'
      'fans@bandacachanilla.com'
      'juan.rosas@prohygiene.com.mx'
      'prohygiene@prohygiene.com.mx'
      'alfredo.osio@prohygiene.com.mx'
      'falcon@casasalfa.com'
      'fcota@casasalfa.com'
      'cmurillo@casasalfa.com'
      'brenda@cubamartini.com'
      'almarosa@aceuniformes.com'
      'guillermina.olea@arteferro-fence.com'
      'acanez@aceuniformes.com'
      'jorge.rosas@prohygiene.com.mx'
      'mariel.luna@prohygiene.com.mx'
      'carlos.davila@prohygiene.com.mx'
      'curso@almejo.com'
      'ryan@casablancasf.com'
      'cesar@visiona360.com'
      'esalgado@lomstudio.com'
      'jlgv@drpc.com.mx'
      'losjohnsons@sunsound.com.mx'
      'karla.andalon@tbmcarriers.com'
      'rplata@investinlajolla.com'
      'nadia.flores@tbmcarriers.com'
      'gilberto.mejia@tbmcarriers.com'
      'mercedes.alonzo@tbmcarriers.com'
      'martha.loubet@drpc.com.mx'
      'minerva@visiona360.com'
      'dora.aranda@tbmcarriers.com'
      'gustavo.flores@tbmcarriers.com'
      's.integracion@casasalfa.com'
      'abreton@vjfrescodelnorte.com'
      'arturo.santiago@tbmcarriers.com'
      'norma.gonzalez@empaquesr.com'
      'aracely.ramirez@empaquesr.com'
      'gabriela.garcia@empaquesr.com'
      'amado.madrigal@empaquesr.com'
      'marco.mejia@empaquesr.com'
      'german.mejia@empaquesr.com'
      'arturo.mejia@empaquesr.com'
      'zulema.mejia@empaquesr.com'
      'teresa.padilla@empaquesr.com'
      'diego.rubio@empaquesr.com'
      'javier.moreno@empaquesr.com'
      'daniel.morales@empaquesr.com'
      'rosy.barraza@empaquesr.com'
      'gonzalo.gutierrez@empaquesr.com'
      'carmen.mejia@empaquesr.com'
      'norma.rodriguez@empaquesr.com'
      'jose.garcia@empaquesr.com'
      'evelin.martinez@casasalfa.com'
      'irene.alatorre@casasalfa.com'
      'sergio@garin.com.mx'
      'kyle@casablancasf.com'
      'ricardo.fierro@casasalfa.com'
      'josema.f@casasalfa.com'
      'josea.acuna@casasalfa.com'
      'vladimir.garcia@casasalfa.com'
      'veronica.v@casasalfa.com'
      'fernando.figueroa@casasalfa.com'
      'emilia.akemi@casasalfa.com'
      'alejandro.urias@casasalfa.com'
      'diego.trinidad@casasalfa.com'
      'mantenimiento@sanpedroac.com'
      'vigilancia@sanpedroac.com'
      'comitetecnico@sanpedroac.com'
      'daniela@casasalfa.com'
      'carlos@visiona360.com'
      'alberto@visiona360.com'
      'montejano@etceteraaccesorios.com'
      'gerardo.calvo@tbmcarriers.com'
      'fabiola@tbmdemexico.net'
      'josev@tbmdemexico.net'
      'amascareno@tbmdemexico.net'
      'yanetf@tbmdemexico.net'
      'raul.cuadras@tbmdemexico.net'
      'esther.ramirez@tbmdemexico.net'
      'alan.villareal@tbmdemexico.net'
      'angelica.castro@tbmdemexico.net'
      'carlos.orozco@tbmdemexico.net'
      'melany.martinez@tbmdemexico.net'
      'raul.meza@tbmdemexico.net'
      'edgar.rodriguez@tbmdemexico.net'
      'karla.andalon@tbmdemexico.net'
      'nadia.flores@tbmdemexico.net'
      'gilberto.mejia@tbmdemexico.net'
      'mercedes.alonzo@tbmdemexico.net'
      'viorozco@drpc.com.mx'
      'prueba@tbmdemexico.net'
      'sgarcia@grupocubo.com.mx'
      'kledesma@grupocubo.com.mx'
      'valfaro@grupocubo.com.mx'
      'mmejia@grupocubo.com.mx'
      'bhernandez@grupocubo.com.mx'
      'molmos@grupocubo.com.mx'
      'rmaciel@grupocubo.com.mx'
      'contacto@grupocubo.com.mx'
      'alma.ramirez@prohygiene.com.mx'
      'eduardomtz@alarmex.com.mx'
      'sistemasspa@alarmex.com.mx'
      'jgutierrez@alarmex.com.mx'
      'melissa.slim@dutyworks.com'
      'jose.rodriguez@empaquesr.com'
      'daniel.rios@empaquesr.com'
      'sandra.sibayama@empaquesr.com'
      'gabino.rivera@orthotechs.com.mx'
      'desertica@sunsound.com.mx'
      'mary.espinoza@casasalfa.com'
      'teresa.cardenas@arteferro-fence.com'
      'esteban.cienfuegos@empaquesr.com'
      'graciela.cristerna@casasalfa.com'
      'miros.rivera@casasalfa.com'
      'karena.martinez@viajesbojorquezmxl.com'
      'jesus.rabago@viajesbojorquezmxl.com'
      'thalia.lopez@viajesbojorquezmxl.com'
      'carmen.lopez@viajesbojorquezmxl.com'
      'ventas@abejitas.com'
      'ventas@puertadhierro.com'
      'ventas@garin.com.mx'
      'ventas@serviciosdeldesierto.com'
      'ventas@promueve.com.mx'
      'ventas@productosherbalife.com.mx'
      'ventas@pesimexicali.com'
      'ventas@arteferro-fence.com'
      'ventas@dutyworks.com'
      'ventas@bajaequipos.com'
      'ventas@silverbreezei.com'
      'ventas@semamarioelpionero.com'
      'ventas@proshield.com.mx'
      'ventas@casasalfa.com'
      'ventas@spaciolevegaleria.com'
      'ventas@agenciaenlaces.com.mx'
      'ventas@aceuniformes.com'
      'ventas@empaquesr.com')
    TabOrder = 1
  end
  object mBody: TMemo
    Left = 8
    Top = 56
    Width = 313
    Height = 73
    Lines.Strings = (
      'Corporacion Mexicalense S.A de C.V.'
      ''
      'Solo alarmex te da toda la atencion personal, seguridad real y '
      'proteccion total para su familia o negocio.'
      ''
      ''
      'Visita la siguiente liga:'
      'http://www.alarmex.com.mx/promo/promo.html'
      ''
      ''
      ''
      'Corporacion Mexicalense S.A de C.V.'
      'Lazaro Cardenas del Rio No.359 Ex. Ejido Coahuila'
      'Tel. 104-2000, Mexicali, B.C.'
      ''
      ''
      
        'Si desea no seguir recibiendo estos correos de promosion escriba' +
        ' un correo a  sistemaSSPA@alarmex.com.mx')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object madjuntos: TMemo
    Left = 8
    Top = 152
    Width = 313
    Height = 73
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object edasunto: TRzEdit
    Left = 56
    Top = 8
    Width = 265
    Height = 21
    Text = 'Alarmex. Usted vaya tranquilo!...'
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 4
  end
  object RzBitBtn1: TRzBitBtn
    Left = 336
    Top = 278
    Width = 153
    Height = 33
    Caption = '&Cerrar'
    HotTrack = True
    TabOrder = 5
    OnClick = RzBitBtn1Click
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000630E0000630E00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86CE8E8
      E8E8E8E8E8E8E8E8B4E8E8E8E881E8E8E8E8E8E8E8E8E8E8ACE8E8E897B46CE8
      E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8E8E897C7B46C
      E8E8E8E8E8E8E8B4E8E8E8E881E3AC81E8E8E8E8E8E8E8ACE8E8E8E8E897C090
      E8E8E8E8E8E8B4E8E8E8E8E8E881E381E8E8E8E8E8E8ACE8E8E8E8E8E8E890B4
      6CE8E8E8E8B46CE8E8E8E8E8E8E881AC81E8E8E8E8AC81E8E8E8E8E8E8E8E890
      B46CE8E8B46CE8E8E8E8E8E8E8E8E881AC81E8E8AC81E8E8E8E8E8E8E8E8E8E8
      90B46CB46CE8E8E8E8E8E8E8E8E8E8E881AC81AC81E8E8E8E8E8E8E8E8E8E8E8
      E890B46CE8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8E8
      90B46C906CE8E8E8E8E8E8E8E8E8E8E881AC818181E8E8E8E8E8E8E8E8E8E890
      B46CE8E8906CE8E8E8E8E8E8E8E8E881AC81E8E88181E8E8E8E8E8E8E890B4B4
      6CE8E8E8E8906CE8E8E8E8E8E881ACAC81E8E8E8E88181E8E8E8E8E890C7B46C
      E8E8E8E8E8E8906CE8E8E8E881E3AC81E8E8E8E8E8E88181E8E8E8E87A907AE8
      E8E8E8E8E8E8E8E890E8E8E8AC81ACE8E8E8E8E8E8E8E8E881E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object btnadjuntar: TRzBitBtn
    Left = 8
    Top = 232
    Width = 161
    Caption = '&Adjuntar Archivos'
    HotTrack = True
    TabOrder = 6
    OnClick = btnadjuntarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000430B0000430B00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E85E
      0909095EE8E8E8E8E8E8E8E8E8E8E8AC818181ACE8E8E8E8E8E8E8E8E8E85E09
      E8E8E8095EE8E8E8E8E8E8E8E8E8AC81E8E8E881ACE8E8E8E8E8E8E8E8E809E8
      E8E8E8E809E8E8E8E8E8E8E8E8E881E8E8E8E8E881E8E8E8E8E8E8E8E8E809E8
      5E095EE809E8E8E8E8E8E8E8E8E881E8AC81ACE881E8E8E8E8E8E8E8E8E809E8
      09E809E809E8E8E8E8E8E8E8E8E881E881E881E881E8E8E8E8E8E8E8E8E809E8
      09E809E809E8E8E8E8E8E8E8E8E881E881E881E881E8E8E8E8E8E8E8E8E809E8
      09E809E809E8E8E8E8E8E8E8E8E881E881E881E881E8E8E8E8E8E8E8E8E809E8
      09E809E809E8E8E8E8E8E8E8E8E881E881E881E881E8E8E8E8E8E8E8E8E809E8
      09E809E809E8E8E8E8E8E8E8E8E881E881E881E881E8E8E8E8E8E8E8E8E809E8
      09E809E809E8E8E8E8E8E8E8E8E881E881E881E881E8E8E8E8E8E8E8E8E809E8
      09E809E809E8E8E8E8E8E8E8E8E881E881E881E881E8E8E8E8E8E8E8E8E809E8
      09E809E809E8E8E8E8E8E8E8E8E881E881E881E881E8E8E8E8E8E8E8E8E8E8E8
      09E8E8E809E8E8E8E8E8E8E8E8E8E8E881E8E8E881E8E8E8E8E8E8E8E8E8E8E8
      09E8E8E809E8E8E8E8E8E8E8E8E8E8E881E8E8E881E8E8E8E8E8E8E8E8E8E8E8
      09E8E8E809E8E8E8E8E8E8E8E8E8E8E881E8E8E881E8E8E8E8E8E8E8E8E8E8E8
      E8090909E8E8E8E8E8E8E8E8E8E8E8E8E8818181E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 288
    Top = 8
  end
  object ODadjuntos: TRzOpenDialog
    Filter = 
      'Todos los Archivos (*.*)|*.*|Archivos BMP|*.bmp|Archivos JPG|*.j' +
      'pg|Archivos PNG|*.png|Archivos GIF|*.gif|Archivos SWF|*.swf|Arch' +
      'ivos PDF|*.pdf|Archivos Word|*.doc|Archivos Excel|*.xls|Archivos' +
      ' Power Point|*.ppt|Ejecutables|*.exe'
    Left = 248
    Top = 8
  end
end
