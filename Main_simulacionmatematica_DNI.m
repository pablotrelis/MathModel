classdef Main_simulacionmatematica_DNI < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure               matlab.ui.Figure
        GridLayout_main        matlab.ui.container.GridLayout
        GridLayout_axes        matlab.ui.container.GridLayout
        GridLayout_axes_menu   matlab.ui.container.GridLayout
        Slider                 matlab.ui.control.Slider
        GridLayout             matlab.ui.container.GridLayout
        CorrienteexternaLabel  matlab.ui.control.Label
        ValorIap               matlab.ui.control.NumericEditField
        gbarNaEditFieldLabel   matlab.ui.control.Label
        ValorgbarNa            matlab.ui.control.NumericEditField
        Slider_2               matlab.ui.control.Slider
        Tabs4                  matlab.ui.container.TabGroup
        Tab_2                  matlab.ui.container.Tab
        GridLayout4            matlab.ui.container.GridLayout
        UIAxes3                matlab.ui.control.UIAxes
        UIAxes2                matlab.ui.control.UIAxes
        Tab2_2                 matlab.ui.container.Tab
        GridLayout5            matlab.ui.container.GridLayout
        UIAxes4                matlab.ui.control.UIAxes
        Tab3                   matlab.ui.container.Tab
        GridLayout6            matlab.ui.container.GridLayout
        UIAxes5                matlab.ui.control.UIAxes
        Tab4                   matlab.ui.container.Tab
        GridLayout7            matlab.ui.container.GridLayout
        UIAxes6                matlab.ui.control.UIAxes
        Tabs1y2                matlab.ui.container.Panel
        GridLayout8            matlab.ui.container.GridLayout
        TabGroup               matlab.ui.container.TabGroup
        VoltageChangeTab       matlab.ui.container.Tab
        GridLayout9            matlab.ui.container.GridLayout
        UIAxes_tab1            matlab.ui.control.UIAxes
        IonChannelCurrentsTab  matlab.ui.container.Tab
        GridLayout10           matlab.ui.container.GridLayout
        UIAxes_tab2            matlab.ui.control.UIAxes
        UIAxes                 matlab.ui.control.UIAxes
        MenuPanel              matlab.ui.container.Panel
        GridLayout_menu        matlab.ui.container.GridLayout
        btn_ej1                matlab.ui.control.StateButton
        btn_ej2                matlab.ui.control.StateButton
        btn_ej3                matlab.ui.control.StateButton
        btn_ej4                matlab.ui.control.StateButton
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Value changed function: btn_ej1
        function btn_1(app, event)
            if app.btn_ej1.Value==1
                app.Tabs1y2.Visible='on';
                app.Tabs4.Visible='off';
                app.UIAxes.Visible='off';
                [t,V,ion]=mainHH_Euler_DNI();
                plot(app.UIAxes_tab1,t,V)
                plot(app.UIAxes_tab2,t(1:length(ion.INa)),ion.INa, ...
                    'g',t(1:length(ion.INa)),ion.IK,'r', ...
                    t(1:length(ion.INa)),ion.Il,'k','LineWidth',2)
                legend(app.UIAxes_tab2,'INa','IK','Ir');
                app.Slider_2.Visible = 'off';
                app.Slider.Visible = 'on';
                app.Slider.Value=0.1;
                app.ValorIap.Value=app.Slider.Value;
                app.ValorgbarNa.Value=0;
                app.ValorIap.Enable='on';
                app.ValorgbarNa.Enable='off';
                %Disable other btn
                app.btn_ej2.Value=0;
                app.btn_ej3.Value=0;
                app.btn_ej4.Value=0;
            else
                cla(app.UIAxes)
                cla(app.UIAxes_tab1)
                cla(app.UIAxes_tab2)
                app.Tabs1y2.Visible='off';
                app.Tabs4.Visible='off';
                app.UIAxes.Visible='off';
                app.Slider_2.Visible = 'off';
                app.Slider.Visible = 'off';
                app.ValorIap.Enable='off';
                app.ValorgbarNa.Enable='off';
                app.ValorgbarNa.Value=0;
                app.ValorIap.Value=0;
            end
        end

        % Value changing function: Slider
        function Iap_slider(app, event)
            changingValue = event.Value;
            app.ValorIap.Value=changingValue;
            [t,V,ion]=mainHH_Euler_DNI(changingValue);
            plot(app.UIAxes_tab1,t,V)
            plot(app.UIAxes_tab2,t(1:length(ion.INa)),ion.INa, ...
                'g',t(1:length(ion.INa)),ion.IK,'r', ...
                t(1:length(ion.INa)),ion.Il,'k','LineWidth',2)
            legend(app.UIAxes_tab2,'INa','IK','Ir');
        end

        % Value changed function: btn_ej2
        function btn_2(app, event)
            if app.btn_ej2.Value==1
                app.Slider.Value=0.5;
                app.ValorgbarNa.Value=0;
                app.Tabs1y2.Visible='on';
                app.Tabs4.Visible='off';
                app.UIAxes.Visible='off';
                [t,V,ion]=mainHH_Euler_DNI(app.Slider.Value);
                plot(app.UIAxes_tab1,t,V)
                plot(app.UIAxes_tab2,t(1:length(ion.INa)),ion.INa, ...
                    'g',t(1:length(ion.INa)),ion.IK,'r', ...
                    t(1:length(ion.INa)),ion.Il,'k','LineWidth',2)
                legend(app.UIAxes_tab2,'INa','IK','Ir');
                app.Slider_2.Visible = 'off';
                app.Slider.Visible = 'on';
                app.ValorIap.Value=app.Slider.Value;
                app.ValorIap.Enable='on';
                app.ValorgbarNa.Enable='off';
                %Disable other btn
                app.btn_ej1.Value=0;
                app.btn_ej3.Value=0;
                app.btn_ej4.Value=0;
            else
                cla(app.UIAxes)
                cla(app.UIAxes_tab1)
                cla(app.UIAxes_tab2)
                app.Tabs1y2.Visible='off';
                app.Tabs4.Visible='off';
                app.UIAxes.Visible='off';
                app.Slider_2.Visible = 'off';
                app.Slider.Visible = 'off';
                app.ValorIap.Enable='off';
                app.ValorgbarNa.Enable='off';
                app.ValorgbarNa.Value=0;
                app.ValorIap.Value=0;
            end
        end

        % Value changed function: btn_ej3
        function btn_3(app, event)
            if app.btn_ej3.Value==1
                cla(app.UIAxes)
                app.Tabs1y2.Visible='off';
                app.Tabs4.Visible='off';
                app.UIAxes.Visible='on';
                app.Slider_2.Visible = 'on';
                app.Slider.Visible = 'off';
                app.Slider_2.Value=1.2;
                app.ValorIap.Enable='off';
                app.ValorgbarNa.Enable='on';
                app.ValorgbarNa.Value=app.Slider_2.Value;
                app.ValorIap.Value=0;
                gbarNa=[(1.2*0.8) 1.2 1.2*1.2 ];
                [t,V]=Simulaalcoholycafeina_DNI(gbarNa);
                hold(app.UIAxes, 'on' )
                plot(app.UIAxes,t{1},V{1})
                plot(app.UIAxes,t{2},V{2})
                plot(app.UIAxes,t{3},V{3})
                hold(app.UIAxes, 'off' )
                legend(app.UIAxes,'Alcohol','Normal','Cafeína');
                %Disable other btn
                app.btn_ej1.Value=0;
                app.btn_ej2.Value=0;
                app.btn_ej4.Value=0;
            else
                cla(app.UIAxes)
                cla(app.UIAxes_tab1)
                cla(app.UIAxes_tab2)
                app.Tabs1y2.Visible='off';
                app.Tabs4.Visible='off';
                app.UIAxes.Visible='off';
                app.Slider_2.Visible = 'off';
                app.Slider.Visible = 'off';
                app.ValorIap.Enable='off';
                app.ValorgbarNa.Enable='off';
                app.ValorgbarNa.Value=0;
                app.ValorIap.Value=0;
            end
        end

        % Value changing function: Slider_2
        function gbarNa_slider(app, event)
            changingValue = event.Value;
            app.ValorgbarNa.Value=changingValue;
            gbarNa=[(1.2*0.8) changingValue 1.2*1.2 ];
            [t,V]=Simulaalcoholycafeina_DNI(gbarNa);
            plot(app.UIAxes,t{1},V{1})
            hold(app.UIAxes, 'on' )
            plot(app.UIAxes,t{2},V{2})
            plot(app.UIAxes,t{3},V{3})
            hold(app.UIAxes, 'off' )
            legend(app.UIAxes,'Alcohol','Normal','Cafeína');
        end

        % Value changed function: btn_ej4
        function btn_4(app, event)
            if app.btn_ej4.Value==1
                app.Tabs1y2.Visible='off';
                app.Tabs4.Visible='on';
                app.UIAxes.Visible='off';
                app.Slider_2.Visible = 'off';
                app.Slider.Visible = 'off';
                app.ValorIap.Enable='off';
                app.ValorgbarNa.Enable='off';
                app.ValorgbarNa.Value=0;
                app.ValorIap.Value=0;
                
                [var]=calculaelectromiogramas_DNI;
                %TAB1
                plot(app.UIAxes2,var.AP_sano), hold(app.UIAxes2,'on')
                plot(app.UIAxes2,var.AP_sano_des), hold(app.UIAxes2,'off')
                plot(app.UIAxes3,var.AP_isch), hold(app.UIAxes3,'on')
                plot(app.UIAxes3,var.AP_isch_des), hold(app.UIAxes3,'off')
                %TAB2
                plot(app.UIAxes4,var.EGM_sano)
                %TAB3
                plot(app.UIAxes5,var.EGM_ischemico)
                %TAB4
                plot(app.UIAxes6,var.EGM_transicion)
                %Disable other btn
                app.btn_ej1.Value=0;
                app.btn_ej2.Value=0;
                app.btn_ej3.Value=0;
            else
                cla(app.UIAxes)
                cla(app.UIAxes_tab1)
                cla(app.UIAxes_tab2)
                app.Tabs1y2.Visible='off';
                app.Tabs4.Visible='off';
                app.UIAxes.Visible='off';
                app.Slider_2.Visible = 'off';
                app.Slider.Visible = 'off';
                app.ValorIap.Enable='off';
                app.ValorgbarNa.Enable='off';
                app.ValorgbarNa.Value=0;
                app.ValorIap.Value=0;
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 740 580];
            app.UIFigure.Name = 'MATLAB App';

            % Create GridLayout_main
            app.GridLayout_main = uigridlayout(app.UIFigure);
            app.GridLayout_main.ColumnWidth = {'1x', '2x'};
            app.GridLayout_main.RowHeight = {'1x'};

            % Create GridLayout_axes
            app.GridLayout_axes = uigridlayout(app.GridLayout_main);
            app.GridLayout_axes.ColumnWidth = {'1x'};
            app.GridLayout_axes.RowHeight = {'2x', '1x'};
            app.GridLayout_axes.Padding = [0 0 0 0];
            app.GridLayout_axes.Layout.Row = 1;
            app.GridLayout_axes.Layout.Column = 2;

            % Create GridLayout_axes_menu
            app.GridLayout_axes_menu = uigridlayout(app.GridLayout_axes);
            app.GridLayout_axes_menu.ColumnWidth = {'1x'};
            app.GridLayout_axes_menu.Layout.Row = 2;
            app.GridLayout_axes_menu.Layout.Column = 1;

            % Create Slider
            app.Slider = uislider(app.GridLayout_axes_menu);
            app.Slider.Limits = [0 1];
            app.Slider.ValueChangingFcn = createCallbackFcn(app, @Iap_slider, true);
            app.Slider.Visible = 'off';
            app.Slider.Layout.Row = 1;
            app.Slider.Layout.Column = 1;
            app.Slider.Value = 0.1;

            % Create GridLayout
            app.GridLayout = uigridlayout(app.GridLayout_axes_menu);
            app.GridLayout.ColumnWidth = {'2x', '1x'};
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.Layout.Row = 2;
            app.GridLayout.Layout.Column = 1;

            % Create CorrienteexternaLabel
            app.CorrienteexternaLabel = uilabel(app.GridLayout);
            app.CorrienteexternaLabel.Layout.Row = 1;
            app.CorrienteexternaLabel.Layout.Column = 1;
            app.CorrienteexternaLabel.Text = 'Corriente externa';

            % Create ValorIap
            app.ValorIap = uieditfield(app.GridLayout, 'numeric');
            app.ValorIap.Editable = 'off';
            app.ValorIap.Layout.Row = 1;
            app.ValorIap.Layout.Column = 2;

            % Create gbarNaEditFieldLabel
            app.gbarNaEditFieldLabel = uilabel(app.GridLayout);
            app.gbarNaEditFieldLabel.Layout.Row = 2;
            app.gbarNaEditFieldLabel.Layout.Column = 1;
            app.gbarNaEditFieldLabel.Text = 'gbarNa';

            % Create ValorgbarNa
            app.ValorgbarNa = uieditfield(app.GridLayout, 'numeric');
            app.ValorgbarNa.Editable = 'off';
            app.ValorgbarNa.Layout.Row = 2;
            app.ValorgbarNa.Layout.Column = 2;

            % Create Slider_2
            app.Slider_2 = uislider(app.GridLayout_axes_menu);
            app.Slider_2.Limits = [0.96 1.44];
            app.Slider_2.ValueChangingFcn = createCallbackFcn(app, @gbarNa_slider, true);
            app.Slider_2.Visible = 'off';
            app.Slider_2.Layout.Row = 1;
            app.Slider_2.Layout.Column = 1;
            app.Slider_2.Value = 1.2;

            % Create Tabs4
            app.Tabs4 = uitabgroup(app.GridLayout_axes);
            app.Tabs4.Visible = 'off';
            app.Tabs4.Layout.Row = 1;
            app.Tabs4.Layout.Column = 1;

            % Create Tab_2
            app.Tab_2 = uitab(app.Tabs4);
            app.Tab_2.Title = 'Tab';

            % Create GridLayout4
            app.GridLayout4 = uigridlayout(app.Tab_2);
            app.GridLayout4.ColumnWidth = {'1x'};

            % Create UIAxes3
            app.UIAxes3 = uiaxes(app.GridLayout4);
            title(app.UIAxes3, {'AP ischemico y '; ' ischemico desfasado'})
            xlabel(app.UIAxes3, 'Samples')
            ylabel(app.UIAxes3, 'Voltage')
            zlabel(app.UIAxes3, 'Z')
            app.UIAxes3.Layout.Row = 2;
            app.UIAxes3.Layout.Column = 1;

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.GridLayout4);
            title(app.UIAxes2, 'AP Sano y sano desfasado')
            xlabel(app.UIAxes2, 'Samples')
            ylabel(app.UIAxes2, 'Voltage')
            zlabel(app.UIAxes2, 'Z')
            app.UIAxes2.Layout.Row = 1;
            app.UIAxes2.Layout.Column = 1;

            % Create Tab2_2
            app.Tab2_2 = uitab(app.Tabs4);
            app.Tab2_2.Title = 'Tab2';

            % Create GridLayout5
            app.GridLayout5 = uigridlayout(app.Tab2_2);
            app.GridLayout5.ColumnWidth = {'1x'};
            app.GridLayout5.RowHeight = {'1x'};

            % Create UIAxes4
            app.UIAxes4 = uiaxes(app.GridLayout5);
            title(app.UIAxes4, 'EGM_sano')
            xlabel(app.UIAxes4, 'Samples')
            ylabel(app.UIAxes4, 'Voltage')
            zlabel(app.UIAxes4, 'Z')
            app.UIAxes4.YLim = [-80 40];
            app.UIAxes4.Layout.Row = 1;
            app.UIAxes4.Layout.Column = 1;

            % Create Tab3
            app.Tab3 = uitab(app.Tabs4);
            app.Tab3.Title = 'Tab3';

            % Create GridLayout6
            app.GridLayout6 = uigridlayout(app.Tab3);
            app.GridLayout6.ColumnWidth = {'1x'};
            app.GridLayout6.RowHeight = {'1x'};

            % Create UIAxes5
            app.UIAxes5 = uiaxes(app.GridLayout6);
            title(app.UIAxes5, 'EGM_ischemico')
            xlabel(app.UIAxes5, 'Samples')
            ylabel(app.UIAxes5, 'Voltage')
            zlabel(app.UIAxes5, 'Z')
            app.UIAxes5.YLim = [-80 40];
            app.UIAxes5.ZLim = [-80 40];
            app.UIAxes5.Layout.Row = 1;
            app.UIAxes5.Layout.Column = 1;

            % Create Tab4
            app.Tab4 = uitab(app.Tabs4);
            app.Tab4.Title = 'Tab4';

            % Create GridLayout7
            app.GridLayout7 = uigridlayout(app.Tab4);
            app.GridLayout7.ColumnWidth = {'1x'};
            app.GridLayout7.RowHeight = {'1x'};

            % Create UIAxes6
            app.UIAxes6 = uiaxes(app.GridLayout7);
            title(app.UIAxes6, 'EGM_transicion')
            xlabel(app.UIAxes6, 'Samples')
            ylabel(app.UIAxes6, 'Voltage')
            zlabel(app.UIAxes6, 'Z')
            app.UIAxes6.YLim = [-80 40];
            app.UIAxes6.ZLim = [-80 40];
            app.UIAxes6.Layout.Row = 1;
            app.UIAxes6.Layout.Column = 1;

            % Create Tabs1y2
            app.Tabs1y2 = uipanel(app.GridLayout_axes);
            app.Tabs1y2.Visible = 'off';
            app.Tabs1y2.Layout.Row = 1;
            app.Tabs1y2.Layout.Column = 1;

            % Create GridLayout8
            app.GridLayout8 = uigridlayout(app.Tabs1y2);
            app.GridLayout8.ColumnWidth = {'1x'};
            app.GridLayout8.RowHeight = {'1x'};
            app.GridLayout8.Padding = [0 0 0 0];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.GridLayout8);
            app.TabGroup.Layout.Row = 1;
            app.TabGroup.Layout.Column = 1;

            % Create VoltageChangeTab
            app.VoltageChangeTab = uitab(app.TabGroup);
            app.VoltageChangeTab.Title = 'Voltage Change';

            % Create GridLayout9
            app.GridLayout9 = uigridlayout(app.VoltageChangeTab);
            app.GridLayout9.ColumnWidth = {'1x'};
            app.GridLayout9.RowHeight = {'1x'};

            % Create UIAxes_tab1
            app.UIAxes_tab1 = uiaxes(app.GridLayout9);
            title(app.UIAxes_tab1, 'Voltage Change for Hodgkin-Huxley Model')
            xlabel(app.UIAxes_tab1, 'Time (ms)')
            ylabel(app.UIAxes_tab1, 'Voltage (mV)')
            zlabel(app.UIAxes_tab1, 'Z')
            app.UIAxes_tab1.Layout.Row = 1;
            app.UIAxes_tab1.Layout.Column = 1;

            % Create IonChannelCurrentsTab
            app.IonChannelCurrentsTab = uitab(app.TabGroup);
            app.IonChannelCurrentsTab.Title = 'Ion Channel Currents';

            % Create GridLayout10
            app.GridLayout10 = uigridlayout(app.IonChannelCurrentsTab);
            app.GridLayout10.ColumnWidth = {'1x'};
            app.GridLayout10.RowHeight = {'1x'};

            % Create UIAxes_tab2
            app.UIAxes_tab2 = uiaxes(app.GridLayout10);
            title(app.UIAxes_tab2, 'Ion channel currents')
            xlabel(app.UIAxes_tab2, 'Time (ms)')
            ylabel(app.UIAxes_tab2, 'Ion channel currents')
            zlabel(app.UIAxes_tab2, 'Z')
            app.UIAxes_tab2.Layout.Row = 1;
            app.UIAxes_tab2.Layout.Column = 1;

            % Create UIAxes
            app.UIAxes = uiaxes(app.GridLayout_axes);
            title(app.UIAxes, 'Efecto alcohol y cafeína sobre potencial de acción')
            xlabel(app.UIAxes, 'Time (ms)')
            ylabel(app.UIAxes, 'Voltage (mV)')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Visible = 'off';
            app.UIAxes.Layout.Row = 1;
            app.UIAxes.Layout.Column = 1;

            % Create MenuPanel
            app.MenuPanel = uipanel(app.GridLayout_main);
            app.MenuPanel.Title = 'Menú';
            app.MenuPanel.Layout.Row = 1;
            app.MenuPanel.Layout.Column = 1;

            % Create GridLayout_menu
            app.GridLayout_menu = uigridlayout(app.MenuPanel);
            app.GridLayout_menu.ColumnWidth = {'1x'};
            app.GridLayout_menu.RowHeight = {'1x', '1x', '1x', '1x', '4x', '4x'};

            % Create btn_ej1
            app.btn_ej1 = uibutton(app.GridLayout_menu, 'state');
            app.btn_ej1.ValueChangedFcn = createCallbackFcn(app, @btn_1, true);
            app.btn_ej1.Text = 'Ejercicio 1';
            app.btn_ej1.Layout.Row = 1;
            app.btn_ej1.Layout.Column = 1;

            % Create btn_ej2
            app.btn_ej2 = uibutton(app.GridLayout_menu, 'state');
            app.btn_ej2.ValueChangedFcn = createCallbackFcn(app, @btn_2, true);
            app.btn_ej2.Text = 'Ejercicio 2';
            app.btn_ej2.Layout.Row = 2;
            app.btn_ej2.Layout.Column = 1;

            % Create btn_ej3
            app.btn_ej3 = uibutton(app.GridLayout_menu, 'state');
            app.btn_ej3.ValueChangedFcn = createCallbackFcn(app, @btn_3, true);
            app.btn_ej3.Text = 'Ejercicio 3';
            app.btn_ej3.Layout.Row = 3;
            app.btn_ej3.Layout.Column = 1;

            % Create btn_ej4
            app.btn_ej4 = uibutton(app.GridLayout_menu, 'state');
            app.btn_ej4.ValueChangedFcn = createCallbackFcn(app, @btn_4, true);
            app.btn_ej4.Text = 'Ejercicio 4';
            app.btn_ej4.Layout.Row = 4;
            app.btn_ej4.Layout.Column = 1;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Main_simulacionmatematica_DNI

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end