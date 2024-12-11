Player1 = uicontrol('Style','edit','units','normalized','position',[.2625 .125 .2 .0625]);
Player2 = uicontrol('Style','edit','units','normalized','position',[.731255 .125 .2 .0625]);
    Player1.Callback = {@StartButton,'PvP',Player1,Player2};
    Player2.Callback = {@StartButton,'PvP',Player1,Player2};
    
    function StartButton(~,~,Mode,P1,P2)
    Mode
    P1.String
    P2.String
    if ~isempty(P1) && ~isempty(P2)
    StartGame = uicontrol('Style','pushbutton','Units','normalized','Position',[.35,.025,.3,.0625],...
        'String','START','FontSize',20,'FontWeight','bold','BackgroundColor',[0 .7 0]);
    StartGame.Callback = {@MainGame,Mode,P1,P2};
    end
end


