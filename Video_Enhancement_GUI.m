function varargout = Video_Enhancement_GUI(varargin)
% VIDEO_ENHANCEMENT_GUI MATLAB code for Video_Enhancement_GUI.fig
%      VIDEO_ENHANCEMENT_GUI, by itself, creates a new VIDEO_ENHANCEMENT_GUI or raises the existing
%      singleton*.
%
%      H = VIDEO_ENHANCEMENT_GUI returns the handle to a new VIDEO_ENHANCEMENT_GUI or the handle to
%      the existing singleton*.
%
%      VIDEO_ENHANCEMENT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIDEO_ENHANCEMENT_GUI.M with the given input arguments.
%
%      VIDEO_ENHANCEMENT_GUI('Property','Value',...) creates a new VIDEO_ENHANCEMENT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Video_Enhancement_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Video_Enhancement_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%

% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Video_Enhancement_GUI

% Last Modified by GUIDE v2.5 15-Feb-2023 22:09:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Video_Enhancement_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Video_Enhancement_GUI_OutputFcn, ...
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


% --- Executes just before Video_Enhancement_GUI is made visible.
function Video_Enhancement_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Video_Enhancement_GUI (see VARARGIN)

% Choose default command line output for Video_Enhancement_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Video_Enhancement_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Video_Enhancement_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% ************************ BROWSE *****************************************
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global input_video_file
[ video_file_name,video_file_path ] = uigetfile({'*.avi'},'Pick a video file');      %;*.png;*.yuv;*.bmp;*.tif'},'Pick a file');
if(video_file_path == 0)
    return;
end
input_video_file = [video_file_path,video_file_name];
set(handles.edit1,'String',input_video_file);
% Acquiring video
videoObject = VideoReader(input_video_file);
% Display first frame
frame_1 = read(videoObject,1);
axes(handles.axes1);
imshow(frame_1);
drawnow;
axis(handles.axes1,'off');

set(handles.pushbutton2,'Enable','on');
set(handles.pushbutton1,'Enable','on');
%Update handles
handles.videoObject = videoObject;
guidata(hObject,handles);


% ************************ BROWSE TEXT BOX ********************************
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% ************************ START ******************************************
% --- Executes on button press in play.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global videoObject
global frame
videoObject = handles.videoObject;
set(handles.pushbutton3,'Enable','on');

set(handles.pushbutton2,'Enable','off');
axes(handles.axes1);
for frameCount = 2:videoObject.NumberOfFrames
    % Display frames
    set(handles.text3,'String',num2str(frameCount));
    frame = read(videoObject,frameCount);
    imshow(frame);
    drawnow;
end
set(handles.pushbutton2,'Enable','on');
set(handles.pushbutton10,'Enable','on');
set(handles.pushbutton3,'Enable','off');



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if(strcmp(get(handles.pushbutton3,'String'),'PAUSE'))
    set(handles.pushbutton3,'String','Continue');
    uiwait();
else
    set(handles.pushbutton3,'String','PAUSE');
    uiresume();
end

% ************************ EXIT *******************************************
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

delete(handles.figure1);


% --- Executes on button press in INVERSE.
function INVERSE_Callback(hObject, eventdata, handles)
% hObject    handle to INVERSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global input_video_file
v=VideoReader(input_video_file);
frames=get(v,'numberOfFrames');
v2 = uiputfile('.avi');
v2=VideoWriter(v2,'Motion JPEG AVI');
open(v2);
i=1
fprintf('Please wait....');
while i<frames
    ff=read(v,frames-i);
    writeVideo(v2,ff);
    i=i+1;   
end
fprintf('\nDone');
msgbox('Done')
pause(2)
 close(v2);



% --- Executes on button press in GRAY_SHADE.
function GRAY_SHADE_Callback(hObject, eventdata, handles)
% hObject    handle to GRAY_SHADE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global input_video_file
obj = VideoReader(input_video_file);
nFrames = obj.NumberOfFrames;
vidHeight = obj.Height;
vidWidth = obj.Width;
v2 = uiputfile('.avi');
v2=VideoWriter(v2,'Motion JPEG AVI');
fprintf('Please wait....');
open(v2);
mov(1:nFrames) =struct('cdata',zeros(vidHeight,vidWidth,1,'uint8'),...
    'colormap',[]); 
for k = 1 : nFrames
    mov(k).cdata =rgb2gray( read(obj,k));
    writeVideo(v2,mov(k).cdata);
end
fprintf('\nDone');
msgbox('Done')
pause(2)
 close(v2);


% --- Executes on button press in SCREEN_SHOT.
function SCREEN_SHOT_Callback(hObject, eventdata, handles)
% hObject    handle to SCREEN_SHOT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global frame
[filename, pathname] = uiputfile({'*.png';'*.jpg';'*.*'},'Save as');
fileName = fullfile(pathname, filename);
imwrite(frame,fileName);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
msgbox('Thank for using Video Enhancement Tool')
pause(3)
close all
Main_GUI


% --- Executes on button press in enhance.
function enhance_Callback(hObject, eventdata, handles)
% hObject    handle to enhance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global input_video_file
workingDir = cd('D:\Mahesh\PC\Image & Video Enhacement Code\');
% workingDir = cd('E:\Image & Video Enhacement Code\');
rmdir("images\","s");
% mkdir(workingDir)
mkdir(workingDir,'images')
Video = VideoReader(input_video_file);
ii = 1;
fprintf('\nPlease wait....');
while hasFrame(Video)
   img = readFrame(Video);
   filename = [sprintf('%03d',ii) '.jpeg'];
   fullname = fullfile(workingDir,'images',filename);
   imwrite(img,fullname)    % Write out to a JPEG file (img1.jpg, img2.jpg, etc.)
   ii = ii+1;
end
imageNames = dir(fullfile(workingDir,'images','*.jpeg'));
imageNames = {imageNames.name}';
outputVideo = VideoWriter(fullfile(workingDir,'Enhanced output.avi'));
outputVideo.FrameRate = Video.FrameRate;
open(outputVideo)
fprintf('\nVideo converted into %d Frames. Now enhancing starts... ',length(imageNames));
for ii = 1:length(imageNames)
   img = imread(fullfile(workingDir,'images',imageNames{ii}));
   %Cimg = imreducehaze(A,'ContrastEnhancement','none');
  
   B = imreducehaze(img,0.9,Method="approxdcp");
   %A1 = imnlmfilt(B);
   A = B+45;
   %A = imnlmfilt(I);
   %A = imgaussfilt(F,1);  only for blur
   %A = imcomplement(Cimg)
   writeVideo(outputVideo,A)
end
close(outputVideo)
Avi = VideoReader(fullfile(workingDir,'Enhanced output.avi'));
ii = 1;
while hasFrame(Avi)
   mov(ii) = im2frame(readFrame(Avi));
   ii = ii+1;
end
%fprintf('\nEnhancement ');
fprintf('\nDone');
msgbox('Done')
pause(3)
%movie(mov,1,Avi.FrameRate)
