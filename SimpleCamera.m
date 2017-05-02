function varargout = SimpleCamera(varargin)
% SIMPLECAMERA MATLAB code for SimpleCamera.fig
%      SIMPLECAMERA, by itself, creates a new SIMPLECAMERA or raises the existing
%      singleton*.
%
%      H = SIMPLECAMERA returns the handle to a new SIMPLECAMERA or the handle to
%      the existing singleton*.
%
%      SIMPLECAMERA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMPLECAMERA.M with the given input arguments.
%
%      SIMPLECAMERA('Property','Value',...) creates a new SIMPLECAMERA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SimpleCamera_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SimpleCamera_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SimpleCamera

% Last Modified by GUIDE v2.5 21-Oct-2014 20:41:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SimpleCamera_OpeningFcn, ...
                   'gui_OutputFcn',  @SimpleCamera_OutputFcn, ...
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


% --- Executes just before SimpleCamera is made visible.
function SimpleCamera_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SimpleCamera (see VARARGIN)

% Choose default command line output for SimpleCamera
handles.output = hObject;

set(handles.axes1,'Xtick',[],'Ytick',[]);
set(handles.axes3,'Xtick',[],'Ytick',[]);

global win_info str1
win_info=imaqhwinfo('winvideo');

str1 = [ 'Avaliable DeviceIDs:',num2str([win_info.DeviceIDs{:}]),10, 'Used 2 and 3' ,10];
set(handles.edit4,'max',2) ;
set(handles.edit4,'string',str1) ;
set(handles.listbox2 , 'string',win_info.DeviceInfo(2).SupportedFormats )
set(handles.edit1,'String','L')
set(handles.edit7,'String','R')






% Update handles structure
guidata(hObject, handles);
% UIWAIT makes SimpleCamera wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SimpleCamera_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global obj obj1 count str1

hfig2 = figure;

frame = getsnapshot(obj);
subplot(1,2,1)
imshow(frame);

frame1 = getsnapshot(obj1);
subplot(1,2,2)
imshow(frame1);

set(hfig2, 'position', get(0,'ScreenSize'));
pause(str2num(get(handles.edit5,'String')));
temp = get(handles.edit1,'String');
temp1 = get(handles.edit7,'String');

qstring=questdlg('Satisfication ?');
switch qstring
    case 'Yes'
        imwrite(frame,[temp ,num2str(count),'.jpg'],'jpg');
        imwrite(frame1,[temp1 ,num2str(count),'.jpg'],'jpg');
        count = count +1;
        set(handles.edit2,'String', num2str(count))
        close(hfig2)
        str1 = [str1,'Save as ',[temp ,num2str(count),'.jpg'],10 ];
        str1 = [str1,'Save as ',[temp1 ,num2str(count),'.jpg'],10 ];
    case 'No'
        str1 = [str1,'Canceled' ,10];
    case 'Cancel'
        str1 = [str1,'Canceled' ,10];
    case ''
        str1 = [str1,'Canceled' ,10];
end
set(handles.edit4,'string',str1) ;




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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2
global obj obj1 count
global win_info 

button_state = get(hObject,'Value');

PicRetureColor= get(handles.listbox1,'value'); %A的值代表我们选的是第几个选项
switch PicRetureColor
    case 1  
    PicRetureColor='rgb';
    set(handles.pushbutton2,'Enable','on')
    case 2 
    PicRetureColor='grayscale';
    set(handles.pushbutton2,'Enable','on')
end
PicScale = get(handles.listbox2,'value'); %A的值代表我们选的是第几个选项
PicScale = win_info.DeviceInfo(2).SupportedFormats{PicScale};
count = str2num(get(handles.edit2,'string'));

if button_state == get(hObject,'Max')  % Max property when the toggle button is pressed (Max is 1 by default) 
                                                     % Toggle button is pressed-take approperiate action
      set(handles.edit2,'Enable', 'off')
      h = waitbar(0,'请等待...','name','当前进度'); 
      
      obj = videoinput('winvideo',2,PicScale);%这里我们使用'UYVY_1600x1200'的视频采集格式
      vidRes = get(obj, 'VideoResolution'); 
      nBands = get(obj, 'NumberOfBands'); 
      set(obj,'ReturnedColorSpace',PicRetureColor)
       axes(handles.axes1);
      hImage = image( zeros(vidRes(2), vidRes(1), nBands) ); 
      preview(obj, hImage);
      
      close(h)  %关闭进度条
      h1 = waitbar(0.5,'请等待...','name','当前进度'); 
      
      obj1 = videoinput('winvideo',3,PicScale);%这里我们使用'UYVY_1600x1200'的视频采集格式
      vidRes = get(obj1, 'VideoResolution'); 
      nBands = get(obj1, 'NumberOfBands'); 
      set(obj1,'ReturnedColorSpace',PicRetureColor)
      axes(handles.axes3);
      hImage = image( zeros(vidRes(2), vidRes(1), nBands) ); 
      preview(obj1, hImage);
      close(h1)  %关闭进度条

elseif    button_state == get(hObject,'Min')
      closepreview(obj)
      closepreview(obj1)
      stoppreview(obj)
      stoppreview(obj1)
     % set(handles.pushbutton2,'Enable','off')
      set(handles.edit2,'Enable', 'on')
                                          % Toggle button is not pressed-take appropriate action


end








% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
