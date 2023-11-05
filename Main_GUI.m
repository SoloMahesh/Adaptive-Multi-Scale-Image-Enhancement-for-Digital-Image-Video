 function varargout = Main_GUI(varargin)
% Main_GUI MATLAB code for Main_GUI.fig
%      Main_GUI, by itself, creates a new Main_GUI or raises the existing
%      singleton*.
%
%      H = Main_GUI returns the handle to a new Main_GUI or the handle to
%      the existing singleton*.
%
%      Main_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Main_GUI.M with the given input arguments.
%
%      Main_GUI('Property','Value',...) creates a new Main_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the Main_GUI before Main_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_GUI_OpeningFcn via varargin.
%
%      *See Main_GUI Options on GUIDE's Tools menu.  Choose "Main_GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main_GUI

% Last Modified by GUIDE v2.5 21-Dec-2022 14:23:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Main_GUI is made visible.
function Main_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main_GUI (see VARARGIN)

% Choose default command line output for Main_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Main_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Main_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in image_enhancement.
function image_enhancement_Callback(hObject, eventdata, handles)
Image_Enhancement_GUI

% --- Executes on button press in video_enhancement.
function video_enhancement_Callback(hObject, eventdata, handles)
Video_Enhancement_GUI


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
close all
