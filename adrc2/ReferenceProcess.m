function [sys,x0,str,ts]=ReferenceProcess(t,x,u,flag,SetPoint,RisingTime,SampleTime)

global v2 v1

if flag==0
    sys = [0;2;2;0;0;0;1];
     x0 = [0,0];                       
     str = [ ];
     ts = [SampleTime 0];
     v1=0;
     v2=0;
   
elseif flag==2
    
    %%%���׹��ɹ���
    %�ٶ���
    %if t<=RisingTime/2
    %    v2=4*SetPoint*t/RisingTime^2;
    %elseif t>RisingTime/2 & t<=RisingTime
    %    v2=2*(SetPoint/RisingTime)*(1-2/RisingTime*(t-RisingTime/2))
    %else
    %    v2=0;
    %end
    
    
    %%%���ٶ�
    
    v3=SecondRise(SetPoint,RisingTime,t);
    
    %%�ٶ���λ��
    v2=v2+SampleTime*v3;
    v1=v1+SampleTime*v2;
         
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    %%%һ�׹��ȹ���
    %�ٶ���
    %if t>=0 & t<=RisingTime
    %    v2=SetPoint/RisingTime;
    %else
    %    v2=0;
    %end
    %λ����
    %if t>=0 & t<=RisingTime
    %    v1=SetPoint*t/RisingTime;
    %else
    %    v1=SetPoint;
    %end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%\
    
    sys=[v1;v2];
elseif flag==3
    sys=x;
elseif flag==4
    sys=sys+SampleTime;
       
else 
    sys=[];
end