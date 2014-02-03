%ANIMATE Create an animation
%
% Help to create an animation which is a folder full of individual PNG
% format frames numbered 0000.png, 0001.png and so on.
%
% Example::
%
%          anim = Animate('movie');
%
%          for i=1:100
%              plot(...);
%              anim.add();


classdef Animate < handle
    properties
        frame
        dir
    end
    
    methods
        %ANIMATE.ANIMATE Create an animation class
        %
        % A = ANIMATE(NAME) initializes an animation, and creates a folder
        % called NAME to hold the individual frames.
        function a = Animate(name)
            a.frame = 0;
            a.dir = name;
            mkdir(name);
            delete( fullfile(name, '*.png') );
            
        end
        
        %ANIMATE.ADD Adds current plot to the animation
        %
        % A.ADD() prints the current figure in PNG format to the animation
        % folder with a unique sequential filename.
        %
        % A.ADD(FIG) as above but prints figure FIG.
        %
        % See also: print
        function add(a, fh)
            if nargin < 2
                fh = gcf;
            end
            
            print(fh, '-dpng', fullfile(a.dir, sprintf('%04d.png', a.frame)));
            a.frame = a.frame + 1;
        end
        
        function close(a)
        end
    end
end