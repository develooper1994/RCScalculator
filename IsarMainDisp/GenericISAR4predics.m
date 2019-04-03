%----------------------------------------------------------------
% This code for producing ISAR in predics
%----------------------------------------------------------------
clear ; close all; clc
%% ISAR(x,y)
% a=load('kepce.rka.out2');
% fname='kepce.obj';
% [XX,YY,Th1,Ph1,ISAR_VVdB,ISAR_VHdB,ISAR_HVdB,ISAR_HHdB] = IsarMain(a);
Isar;
%% Parse the object
obj = ParseObj(fname); % sadece alt�na nesnenin resmini yerle�tiriyor.
% obj = ParseObjCodeGen(fname); % sadece alt�na nesnenin resmini yerle�tiriyor.
%% figure Bu k�s�m hesaplamas� �ok uzun s�r�yor.
% figure1
rd = 40;
figure1(obj,XX,YY,rd,Th1,Ph1,ISAR_VVdB,ISAR_VHdB);

% figure2
figure2(obj,XX,YY,rd,Th1,Ph1,ISAR_HVdB,ISAR_HHdB);
