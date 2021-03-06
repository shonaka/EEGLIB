classdef class_boxplot
    % for plotting box plot with your intended properties
    %
    %   Usage:
    %       boxplt_obj = class_plot('X',data,'color',color);
    %       output = process(boxplt_obj);
    %
    %   Arguments:
    %       'X': a matrix. Plots one box per column
    %
    %   Options:
    %       'color': what color you want for the plot
    %                [default: 'k' = all black]
    %                provide matrix [num of cols (boxes) x 3 (RGB)]
    %       'outlier': to show outliers or not [default: 'off']
    %
    
    % Copyright (C) 2017 Sho Nakagome (snakagome@uh.edu)
    %
    %     This program is free software: you can redistribute it and/or modify
    %     it under the terms of the GNU General Public License as published by
    %     the Free Software Foundation, either version 3 of the License, or
    %     (at your option) any later version.
    %
    %     This program is distributed in the hope that it will be useful,
    %     but WITHOUT ANY WARRANTY; without even the implied warranty of
    %     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    %     GNU General Public License for more details.
    %
    %     You should have received a copy of the GNU General Public License
    %     along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    properties
        % input (required)
        X;
        
        % other options
        color;
        outlier;
    end
    
    methods (Access = public)
        % defining a constructor
        function obj = class_boxplot(varargin)
            % input data
            obj.X = get_varargin(varargin,'X',randn(20,4));
            
            % other parameters for plotting
            obj.color = get_varargin(varargin,'color','k');
            obj.outlier = get_varargin(varargin,'outlier','off');
        end
    end
    
    methods
        function output = process(obj)            
            % plotting
            plot_obj = boxplot(obj.X,'PlotStyle','compact',...
                'Color',obj.color);
            
            % if option outlier on, exclude outliers from plot
            if strcmpi(obj.outlier,'off')
                h = findobj(gca,'tag','Outliers');
                set(h,'Visible','off');
            end
            
            % some other things to make the plot look nicer
            % this cannot be controlled by defaults
            ax1 = gca;
            set(ax1, 'box', 'off');
            set(ax1, 'TickDir', 'out');
            
            % saving the figure
            output = plot_obj;
        end
    end
    
    methods (Access = private)
        % defining a destructor
        function delete(obj)
            % Delete object
        end
    end
    
end

