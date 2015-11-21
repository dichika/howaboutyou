#' @export
HAY <- function(target=NULL, from, to,
                twitter_consumer_key=NULL,
                twitter_consumer_secret=NULL,
                gmailr_json_path=NULL
                ){
  require(gmailr)
  require(twitteR)
  if(is.null(twitter_consumer_key)){
    twitter_consumer_key <- options()$CONSUMER_KEY
  }
  if(is.null(twitter_consumer_secret)){
    twitter_consumer_secret <- options()$CONSUMER_SECRET
  }
  if(is.null(gmailr_json_path)){
    gmailr_json_path <- options()$GMAILR_PATH
  }
  if(is.null(target)){
    target <- "teramonagi"
  }
  setup_twitter_oauth(twitter_consumer_key,twitter_consumer_secret)
  msg <- userTimeline(target, n=20)
  tfrom <- as.POSIXct(paste(as.character(Sys.Date()), "03:00:00"))
  tto <- as.POSIXct(paste(as.character(Sys.Date()), "08:00:00"))
  getTwTime <- function(x)as.POSIXlt(x$created, tz="Asia/Tokyo")
  num <- max(which(unlist(lapply(msg, function(x)(getTwTime(x) > tfrom) & (getTwTime(x) < tto)))))
  if(is.finite(num)){
    gmail_auth(gmailr_json_path, scope = 'full')
    time <- as.numeric(format(getTwTime(msg[[num]]), "%H"))
    txt <- sprintf("今日の%sは%s時には起きて活動開始しているぞ、お前はどうする？？？",
                   target, time)
    msg <- mime(from=from, to=to, subject="How about you", body=txt)
    send_message(msg)
  }
}
