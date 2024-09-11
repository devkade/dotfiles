#! /usr/bin/env fish

set param $argv[1]

# 현재 창의 크기 가져오기
set pane_width (tmux display-message -p "#{pane_width}")
set pane_height (tmux display-message -p "#{pane_height}")

set new_pane_height (math "floor($pane_height * 3 / 10)")
set new_pane_width (math "ceil($pane_width * 33 / 100)")

# pane 분할
switch $param
    case 1
        tmux split-window -v -l $new_pane_height
        tmux select-pane -U
    case 2
        tmux split-window -v -l $new_pane_height
        tmux split-window -h
        tmux select-pane -U
    case "*"
        tmux split-window -v -l $new_pane_height
        tmux split-window -h -l (math "$new_pane_width * 2")
        tmux split-window -h -l $new_pane_width
        tmux select-pane -U
end
