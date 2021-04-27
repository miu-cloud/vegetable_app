class ConversationsController < ApplicationController
  # Deviseを使用しているならif logged_in?の代わりに下記を使用する
  before_action :authenticate_user!
  def index
    @conversations = Conversation.all
  end
  
  def create
    # 自身で作ったログイン機能であれば、独自実装してあるはずの
    # logged_in?メソッドを使用して、ログイン時のみ会話を保存できるようにする
    if authenticate_user!
    #該当のユーザ間での会話が過去に存在しているか（該当ユーザー間で会話をするためのチャットルームがすでに存在しているか）を確認し,
    #存在した場合その会話（チャットルーム）情報を取得する
      if Conversation.between(params[:sender_id], params[:recipient_id]).present?
        @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    #もし過去に一件も存在しなかった場合強制的に会話（チャットルーム）情報を生成
      else
        @conversation = Conversation.create!(conversation_params)
      end
    #いずれの状態であってもその後その会話に紐づくメッセージの一覧画面へ遷移させる
      redirect_to conversation_messages_path(@conversation)
    else  
      redirect_to root_path
    end  
  end
  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end


end
