<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title> Ficha de Prática 1</title>
    <meta name="generator" content="LibreOffice 5.4.5.1 (Linux)"/>
    <meta name="author" content="Maria de Fatima"/>
    <meta name="created" content="2008-08-29T18:47:00"/>
    <meta name="changed" content="2018-03-04T10:50:01.632145836"/>
    <style type="text/css">
        @page {
            size: a4 portrait;
            @frame header_frame {           /* Static Frame */
                -pdf-frame-content: header_content;
                left: 50pt; width: 512pt; top: 50pt; height: 40pt;
            }
            @frame content_frame {          /* Content Frame */
                left: 0.5cm; width: 20cm; top: 0.5cm; height: 632pt;
            }
            @frame footer_frame {           /* Another static Frame */
                -pdf-frame-content: footer_content;
                left: 50pt; width: 512pt; top: 772pt; height: 20pt;
            }
        }
		.tpl {width: 20cm; position: absolute; left: 0; top:-40; display: none;}
		.nficha {width: 18cm; height: 12cm; position: absolute; left: 0cm; top:0cm; border:3px solid}
		.ncard {width: 18cm; height: 12cm; position: absolute; left: 0cm; top:14.5cm; border:3px solid}
		.ficha {width: 100%; height: 12cm; border:3px solid; margin-bottom: 0.5cm}
		.card {width: 100%; height: 12cm; border:3px solid}
		.logo  {margin: 10 10;}
		.title {float:right; margin-right: 30px;}
		.theme {display: flex;
  justify-content: center; padding-top: 40px;}
		.flow {margin-left: 60px; padding-top: 4px; margin-right: 40px; }
		.material {margin-left: 30px; padding-top: 4px;; margin-right: 40px; }
		.note {margin-left: 30px; padding-top: 4px; margin-right: 40px; }
		.pictures {
		    padding-left: 20px; padding-right: 20; margin-top: 5px;display:flex;
        }
		.figure {
		    padding: 5 20;
        }
		.figure img {
		    max-height: 100px;
        }
		.flow_title {
		    margin-left: 0px;
        }
		.foot {
		    padding: 40px;
        }
		.pager {
		    page-break-after: always;
        }
		.nopictures {
		    padding-left: 20px; padding-right: 20; margin-top: 150px;
		      display:flex; justify-content:space-between;
        }

    </style>
</head>
<body lang="en-US" text="#000000" dir="ltr">

    % for card, title, theme, pic, material, note, flow, foot in page:
        <div class="ficha">
            <div class="head">
                <div class="logo">
                    <img src="imagem/agora.gif" name="Logo Ágora" align="left" width="84" height="36"/>
        
                </div>
                <div class="title" style="align:right">
        
        
                        <font face="Arial, sans-serif"><font size="{{sm}}" style="font-size: {{fm}}">
                            <b>{{ title }}</b></font></font>
        
                </div>
            </div>
            <div class="theme">
                    <font face="Arial, sans-serif"><font size="{{sm}}" style="font-size: {{fm}}">
                        <b>{{ theme }}</b></font></font>
        
            </div>
            <div class="pictures">
                % for source, name in pic:
                <div class="figure">
                    <img src="imagem/{{ source }}" name="{{ name }}" align="bottom"
                         width="100%"  border="0"/>
                </div>
                % end
            </div>
            <div class="material">
                % if material:
                    <font face="Arial, sans-serif"><font size="{{sm}}" style="font-size: {{fm}}">
                        <b>Material:</b></font></font>
                   <p lang="pt-BR" class="western" >
                    <font face="Arial, sans-serif"><font size="{{sm}}" style="font-size: {{fm}}">
                        {{ material }}</font></font>
                   </p>
                % end

            </div>
            <div class="note">
                % if note:
                    <font face="Arial, sans-serif"><font size="{{sm}}" style="font-size: {{fm+1}}">
                        <b>NOTA:</b></font></font>
                     <font face="Arial, sans-serif"><font size="{{sm}}" style="font-size: {{fm+1}}">
                        {{ note }}</font></font>
                % end

            </div>
            <div class="flow">
                % for statements, steps, questions in flow:
                <div class="flow_title">
                    % for stats in statements:

                    <p lang="pt-BR" class="western" style="margin-bottom: 0cm; line-height: 100%">
                        <font face="Arial, sans-serif"><font size="{{sm}}" style="font-size: {{fm}}">
                            {{ stats }}</font></font>
                    </p>
                    % end
                </div>
                <div class="flow_list">
                    <p lang="pt-BR" class="western" align="justify" style="margin-bottom: 0cm; line-height: 100%">
                    <font face="Arial, sans-serif"><font size="{{sm}}" style="font-size: {{fm}}">
                    <ol>
                    % for step in steps:
                        <li>

                                {{ step }}
                        </li>
                    % end
                    </ol>
                    </font></font></p>
                </div>
                <div class="flow_list">
                    <p lang="pt-BR" class="western" align="justify" style="margin-bottom: 0cm; line-height: 100%">
                    <font face="Arial, sans-serif"><font size="{{sm}}" style="font-size: {{fm}}">
                    <ul>
                    % for step in questions:
                        <li>

                                {{ step }}
                        </li>
                    % end
                    </ul>
                    </font></font></p>
                </div>
                <div class="foot">

                    <p lang="pt-BR" class="western" style="margin-left: -1.91cm; margin-bottom: 0cm; line-height: 100%">
                        <font face="Arial, sans-serif"><font size="{{sp}}" style="font-size: {{fp}}"><i>
                            {{ foot }}</i></font></font>
                    </p>

                </div>
                % end
            </div>
        % if (int(card) % 2) == 0:
            <div class="pager">

            </div>
        % end

        </div>
    % end
</body>
</html>