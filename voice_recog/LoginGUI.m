function varargout = LoginGUI(varargin)
% LOGINGUI MATLAB code for LoginGUI.fig
%      LOGINGUI, by itself, creates a new LOGINGUI or raises the existing
%      singleton*.
%
%      H = LOGINGUI returns the handle to a new LOGINGUI or the handle to
%      the existing singleton*.
%
%      LOGINGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOGINGUI.M with the given input arguments.
%
%      LOGINGUI('Property','Value',...) creates a new LOGINGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LoginGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LoginGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LoginGUI

% Last Modified by GUIDE v2.5 11-Dec-2018 05:31:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LoginGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @LoginGUI_OutputFcn, ...
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


% --- Executes just before LoginGUI is made visible.
function LoginGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LoginGUI (see VARARGIN)
delete('final/train/*');
delete('final/test/*');
set(findall(handles.uipanel2, '-property', 'enable'), 'enable', 'off');
set(handles.text7,'string','...');

% Choose default command line output for LoginGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

handles.details = [];
handles.index = -1;
guidata(hObject,handles);

% UIWAIT makes LoginGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LoginGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.text11,'string','...');
    set(findall(handles.uipanel2, '-property', 'enable'), 'enable', 'off');
    set(handles.text7,'string','...');
    handles.details
    username = get(handles.edit1,'String');
    password = get(handles.edit2,'String');
    if isempty(username)
        errordlg('Please Enter Username')
    elseif isempty(password)
        errordlg('Please Enter Password')
    else
        handles.index == -1
        if ~isempty(handles.details)
            for i = 1:length(handles.details(:,1))
                if isequal(handles.details(i,1),string(username)) && isequal(handles.details(i,2),string(password))
                    handles.index = i
                    set(findall(handles.uipanel2, '-property', 'enable'), 'enable', 'on');
                end
            end
        end
        if handles.index == -1
            errordlg('Invalid Login Details');
        end
    end
guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text7, 'ForegroundColor', 'black' )
set(handles.text7,'string','...');
check = rectest(handles)
if check == 1
    set(handles.text7, 'ForegroundColor', 'green' )
    set(handles.text7,'string','Valid');
else
    set(handles.text7, 'ForegroundColor', 'Red' )
    set(handles.text7,'string','Invalid');
end




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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(findall(handles.uipanel2, '-property', 'enable'), 'enable', 'off');
    set(handles.text7,'string','...');
    username = get(handles.edit3,'String');
    password = get(handles.edit4,'String');
    if isempty(username)
        errordlg('Please Enter Username')
    elseif isempty(password)
        errordlg('Please Enter Password')
    else
        flag = 0;
        if ~isempty(handles.details)
            for i = 1:length(handles.details(:,1))
                if isequal(handles.details(i,1),string(username))
                    errordlg('User Already Exists');
                    flag = 1;
                end
            end
        end
        if flag == 0
            handles.details = [handles.details;string(username),string(password);]
            rectrain(handles)
        end
    end
    set(handles.edit3,'string','');
    set(handles.edit4,'string','');
guidata(hObject, handles);
