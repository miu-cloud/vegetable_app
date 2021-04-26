class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    # @conversation = Conversation.where(sender_id: params[:user_id])#書いてもらった
    @conversation = Conversation.find(params[:conversation_id])
    #会話に紐づくメッセージを取得する
    @messages = @conversation.messages
    #もしメッセージの数が１０よりも大きければ１０より大きいというフラグを有効にしてメッセージを最新の１０に絞る
    if @messages.length > 10
      @over_ten = true
      @messages = Message.where(id: @messages[-10..-1].pluck(:id))
    end
    #そうでなければ１０より大きいというフラグを無効にして、会話に紐づくメッセージを全て取得する
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    #もし最新（最後）のメッセージが存在し、かつユーザIDが自分（ログインユーザ）でなければ、今映っているメッセージを全て既読にする
    if @messages.last
      @messages.where.not(user_id: current_user.id).update_all(read: true)
    end
    #表示するメッセージを作成日時順（投稿された順）に並び替える
    @messages = @messages.order(:created_at)
    #新規投稿のメッセージ用の変数を作成する
    @message = @conversation.messages.build
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    #送られてきたparamsの値を利用して会話にひもづくメッセージを生成
    @message = @conversation.messages.build(message_params)
    #保存ができれば、会話にひもづくメッセージ一覧の画面（つまりチャットルーム）に遷移する
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      render 'index'
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
