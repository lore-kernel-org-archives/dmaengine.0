Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316588;
	b=QXTSIBQBy6DaSrAUMYjOh5BBZ5ApETWOuXCoakvZ4Satb6mibkpQZj7rok+7iSMdA0cC
	 vgiS/pOkD7O3MeZXpNZvT/9JyIIoqBYCYnTxvx/IQU06r9GjSDRQPWDaK+a9R9/JmAso6
	 MDf8MOEeIyThrWXrtgdDOZ8+RnuGhz+9R7IVlqU5jBr8MMQ1icwtjfDHWwpJ02S9OQzdN
	 CANNUmoC2SIamA5z85oYL4AOFQ93BFHpCINAXVqvaWIXpPFvNpW8ysRrBH2qHHoiZFW0C
	 3IcC3Bq/ca22kTBoi2KmRRzVb8zR40WcD9X/dlIyVu9BHDKADgU1A9gQIFkhdbYGjhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cYhmmDhk9YyrIeJ9b5QNPOWsGYE+KiNLYLN1UcJqjIE=;
	b=LtiTk2d9hOcdtbXNj/hKGKBUkPH1GDGKL2i6CPZA9y1mpmsesv0xv+Unh3RlcblTZHDg
	 2/uyfeo0AIVEvGrrE0NwKBMBwGhXDzJ9d2b66IVe8Fyjl30PHe3mJOTU4DeZC/1jf7yC1
	 s+f1XE13lUNLbzh+u6iETOFi+xwIMu0yUueLsDsSDfK317vfjAOlbhCO+KNbVfV6geEij
	 RmsXk8eydWp2IlqFE08Pz1Cbzp4ZoOM7hGyG7B3zvRwcxCzzpw8P+v3bhHmU97Y8I12LM
	 QfUBMf+EDyZnD7lqh8A0JDYW9YwCaeadAvHA4bsNYf4MONUaA+rcCtGh34B93/ZwxJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vLSN8PsO;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4954860A3831
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4954860A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vLSN8PsO
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1111457a91.0
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316588; x=1794921388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYhmmDhk9YyrIeJ9b5QNPOWsGYE+KiNLYLN1UcJqjIE=;
        b=vLSN8PsOwYs2ON8XuKR3EWKb2IKgNZ4WHvcex5LKAO/bDso+oTHr7yEOQNWjEzsjT/
         IJ6Kql+zRHVXwB7xFxkVqNxaUhpliOerxd0I1sxJH2RzWG+V2giIDuhbJueEzpuOKdb7
         okrBhq7I8LAPxkB6BxMibiRu5zP3bLzBb6jibe/xD338uno88z8aKVk6WBJOPzVBz6Qj
         HSjDRrM0CBjRq0HH8i++t7cxZEplLieb8eiXNv92y/OD5QoRHRjd48yYQOzo/LcREaEO
         zTFYbOmuRA9sMoOCkJubRgqQjrYGfJzwe1lJM6I8l2O/3XT8rm4vuPhnPy/MvBfm6+1Y
         /T8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316588; x=1794921388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYhmmDhk9YyrIeJ9b5QNPOWsGYE+KiNLYLN1UcJqjIE=;
        b=qRvwjyUjrHgCHk75B28hM5CLIg9Wq6rYCXBxq1RyyXhV+LE3cBHM0Hz7RRU5XWdd2i
         wWoNfDfZQ4I6WXtQM6BYMu5CEZlpyHP+6/hz6PolfOBWfwrYJvm2JchMM7QatXc2g5TM
         tU8WlE4aGTv4SHOxdEIB/MB1t0L9Bzt3oOYMZ/rDS/n6SZpQ3PvvMMK1fVqYBYh6KRJq
         LNGUsx50lbazzQEOp7M1xl3dFZHLgXG8AbUmi6y4MzOs+Ky/S0i5wgoqbB6RdYA/LYGI
         jIIxtuVq3HhfWeuVzhxUF4PwA7zF6vYymIJfmWX4JxI7OSOvFvdvE4GQ4C/vLZxuXzLY
         qQmw==
X-Forwarded-Encrypted: i=1; AL+hErG8W8LrXKXiJUNu5Q2eEAFMMGzyxFDlv1rc8gnQyjO7Idx+cLvlD7Cu4C7GuHKaJ/XstJPs62M65h0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T2NW3PLJkEl1BlIRBHxKOB2HQm77Oye6wZG7sPtWmSRwAzlEo
	OuMca4LAZ+JkIOFO/LI/hWYj9fRWF04WcLVi7NxG7Mss4yM3qQS4oS94
X-Gm-Gg: AYBFou3oMqzwDgLwFgzhd6+gCSy3+H2Lswz2LbUrifH1dXyMMnf2wMvCljnzbi6mv2J
	ysdedThrBoFaz9EcllU8/5b8np8EnX9ByNQxgVTuvW2tV4Fdgvf1RrUmAv9ZIBsDKNBA3+hpEvj
	TCCnRAAP88uda/f54zzY7vv3l73grcPOCPtzfKRLVD0zXg/gexkE9FP1rfI2GyGqM19L2mNPYfb
	t6D68U/S6nTGmtqrr1JxI7KMj1rYYgyz1fi5LzVJsTs0ja7Q+INV6h2yJH5U4aGJfwo/0Mftd1Y
	Dvwe57e/JHhqFfXOpSSY2EyICDZ0FAZMvY3qgY6VqGVRR7dQ6OImpyG2CX/xfc64dpbpBiKhh+H
	hdqoDFZ4Bgh5EjVQlIY3lqIXQGNIrRo+YLAyv+KeUFlIKlHKtsgqFyoMHkiSqfgjGXjqkEAPZY3
	DWzTCUKfpW7ao0d2BbbqCQgkA8mhkWRU9MgNRtfhPSYQ2GioPqLhGd8N6GkjzSPISxlcGeNL14E
	CXNqRQuuYs6tFzn/b/DkUSw+XPnlAtIUTOpR0cGLwr2bo26kbkugLfBTG8H6UDn9XHje1T/pHR5
	ZnOzdR/Zs7BwH2fKLkUJbAMxPMg0dpc=
X-Received: by 2002:a17:90b:4c51:b0:3ab:9f1a:3825 with SMTP id 98e67ed59e1d1-3b166aef970mr2935950a91.4.1794316587571;
        Tue, 10 Nov 2026 05:16:27 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:27 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 13/33] dmaengine: mxs-dma: use dmaengine BH scheduling
Date: Tue, 10 Nov 2026 05:13:13 -0800
Message-ID: <dc2a8bc5d071b865be14d8ede93a3b6bc68839a5.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/mxs-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index cfe4d759d65f..3dfd56a53414 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -109,7 +109,6 @@ struct mxs_dma_chan {
 	struct mxs_dma_engine		*mxs_dma;
 	struct dma_chan			chan;
 	struct dma_async_tx_descriptor	desc;
-	struct tasklet_struct		tasklet;
 	unsigned int			chan_irq;
 	struct mxs_dma_ccw		*ccw;
 	dma_addr_t			ccw_phys;
@@ -300,9 +299,9 @@ static dma_cookie_t mxs_dma_tx_submit(struct dma_async_tx_descriptor *tx)
 	return dma_cookie_assign(tx);
 }
 
-static void mxs_dma_tasklet(struct tasklet_struct *t)
+static void mxs_dma_tasklet(struct dma_chan *chan)
 {
-	struct mxs_dma_chan *mxs_chan = from_tasklet(mxs_chan, t, tasklet);
+	struct mxs_dma_chan *mxs_chan = to_mxs_dma_chan(chan);
 
 	dmaengine_desc_get_callback_invoke(&mxs_chan->desc, NULL);
 }
@@ -386,8 +385,8 @@ static irqreturn_t mxs_dma_int_handler(int irq, void *dev_id)
 		dma_cookie_complete(&mxs_chan->desc);
 	}
 
-	/* schedule tasklet on this channel */
-	tasklet_schedule(&mxs_chan->tasklet);
+	/* schedule BH on this channel */
+	dmaengine_schedule_bh(&mxs_chan->chan);
 
 	return IRQ_HANDLED;
 }
@@ -781,7 +780,7 @@ static int mxs_dma_probe(struct platform_device *pdev)
 		mxs_chan->chan.device = &mxs_dma->dma_device;
 		dma_cookie_init(&mxs_chan->chan);
 
-		tasklet_setup(&mxs_chan->tasklet, mxs_dma_tasklet);
+		dmaengine_init_bh(&mxs_chan->chan, mxs_dma_tasklet);
 
 
 		/* Add the channel to mxs_chan list */
-- 
2.43.0

