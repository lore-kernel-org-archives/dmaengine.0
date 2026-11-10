Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316643;
	b=0GtAeREZ6k5uQCi1fOuEpcsdCSJpt2tQ+SbgiQzFTjDxwSsyOzCI4D3wPN+45JLeIS3C
	 V4BXmYmBrQSjlECD0negzLsAOeVzOvt/QSJ++llW+AOo0aOQ2lIQR7AGAAv0n9rZqfLsZ
	 voMwShYymGb+8KCeCtQo5AnJCkKMf+vDNiy6Dv/uRKMybtsnvhCZE2hNm96j7bs39GSUp
	 fxQTr3pnB30vUEK6aqv645bSUlfb+5TlD9v4BnucsAOPhGJ33oZENxXL3eOY47+to7KFT
	 QdNwRLz0v+HJcQ9WPH8ut1rTYskkDFlJeJAimrTM1ouUAWkAjlD3+jhGTGfBehKZ1kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ml3zJxxV6zteBKfYjRhx0ricvuNkb6CeX/qUwgIXjIs=;
	b=d4NMto/dgUBRtm1VQDlsyvi2iW4OP+fE8+9vrYQVINVSCIPKJ0IYL6FxnH8wu5yv6Td9
	 rgRrfwDiD8hGjGm2kCzU/ej5gpbrMyuyxpaZ+DTrGPpZybh4Z/jVp6Uh/jvlzehOl5G/A
	 oCJULLuh94qKaqqGtt+ZoB/xPhDs7E9PFbp/7hHtrg913MXQU84BOCnVvfmBTNNNcjf3o
	 EZplgdIwGQJENCCK0aQBgf5iPCpy/TYo0U/H2Nm6wk3VCJYKvEKObQEz4limdpW8n8p2j
	 bnFvr4abE9/Ifox6Y7+/vVZDqeEZo1iHOyJBBIeAiGHXXw24OT0F57pYqtGOHJoKpLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=giNnwQEf;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2628606ACE9
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2628606ACE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=giNnwQEf
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1099740a91.0
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316642; x=1794921442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ml3zJxxV6zteBKfYjRhx0ricvuNkb6CeX/qUwgIXjIs=;
        b=giNnwQEflUToyyLtq/59cQqoXFJz3maGvZr6eRUrUItqVzcS9xhHzN7Xr6sfibDPa1
         p8V4dm6BRiUD1OHQaISuwb306Cuhw98jw963v/n8Z4p9agA3gPFG2IORMAu3AdPn/mL8
         mrWO2/UH8CKX1H0i4KFjJjLXyZmGhpi9EHG1GpDLL9TKImskwzcDSZ6XGNST0LlozPpj
         DLBR/8OxDE9JbZxP7dINJv52Akywoj1zPLdsklNPnPaVcvy9Q5nnh7Pjkl7iCHzCAlmJ
         YkslGx3p2jagY83WiA1d0VsoIoA+xmrg4pwn5JNtUTQ86vjME9xJxY4fjPGjVID5Zao4
         Tafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316642; x=1794921442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ml3zJxxV6zteBKfYjRhx0ricvuNkb6CeX/qUwgIXjIs=;
        b=Q+1/RiK74poeSrwxC7FWksMpyBUE7M6KoX2gEX39U1r0vZuJrCTP910BKEGSZW7NTz
         czeN2zZdIMp3F0zHEi2F2ActG/Bhnc8tU43psJTElhw2A+kexe2XfenHhsmLfIUc41em
         NgGmUIwQcXESuJFYDw5sSGpPRZ7WlLbS82xqtGMareN1++QWXpYNZRN3wOPBQYXItAUi
         hoqetr7qMj5Q8tDTb5IyXm1dTNF4K5dIXnd80faIKq1jK/xP2vLabqqJ3p2n7YeEQaQT
         FVcexvTpzct9owRup/AhAJKC9cqgi88cfvRXE82UeYMk5LvcB1j8dB+3tEMRCQ6RZ3gi
         WnJQ==
X-Forwarded-Encrypted: i=1; AL+hErHHY30d2/sy43ZmcyADMcWUDe1AbqSVUhyKL0NGZayily2p1hWyR/Tmqs+O3kQ95CpqUanORp3Herk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bkBuo8qVz6xip0t1HX1i+DrCb7f19dzBVW2+cHiU4YqvqTtk6
	hCq7jQqrFLMckgog7W5aWzD1hWkZJvcAaNaxvBpmcCuNMHMIeGlS8714
X-Gm-Gg: AYBFou1xJLarQNIooxV1BLPjWi2PSrg8nHB1RUfTuuxL9hTVVoI/XnSTW5qLBTvYjma
	yceRMEOa8AJb0G9QtB8JQmnaN3YRNEG4t+L0L+prIxbjYNbtm32COpkNXoNNJw4+uZP4a/FlHZv
	PVnnNesIGPgWKfI98g53SV554rM9synJqB5UWY6lrrUoNdXCYSeiSOuLYXctsnAK+jrfm7vFuBP
	5k62VtafomUDQrt0FqfF1jwiVudSfjHZ4uFtvoblG7oyyIo0ybdXgKIMBAueJxHcbx2jxGApjxb
	50b59MNmK08yKLgODXsQmHUJEyQWWsOw4M32Ero9w5Y/TfABscFMtgq1HCkk36xSpvo9XM/aFb3
	bzMLmjkUVXHJJSLOCjYH+WNCPT1zGHURUQWwbEUsHVGL/e33Tvurpap293B8LcSVJmdF6VV/0Vj
	2PJX0Y7aDGeQZ452y7gu6WjMHNsozDDrPBCh6SG8Rqf6dSWo6UiYgkloEs7yhB1A05v12VY4L52
	sKdGw8TDMTVdJNxR+HB7ABygH1pVO9LPvEaqFmkCoztQH1vSSwHxWTco6Y6DOlaY+uxfl69vNha
	TlRon/yBVZ4lstrZfMgINjZZcDvJs4c=
X-Received: by 2002:a17:90b:4a50:b0:3a7:f4d:b23d with SMTP id 98e67ed59e1d1-3b166d30739mr2698856a91.52.1794316641976;
        Tue, 10 Nov 2026 05:17:21 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:21 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Frank Li <Frank.Li@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 28/33] dmaengine: sf-pdma: route error callbacks through channel BH
Date: Tue, 10 Nov 2026 05:13:28 -0800
Message-ID: <25d7826e0e6738356657f523e6f6cf3450e4b26c.1794315350.git.allen.lkml@gmail.com>
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

virt-dma now dispatches completion callbacks through per-channel BH work,
but SF-PDMA invokes the client callback directly from its error tasklet
after exhausting its retries. That descriptor is never actually
completed: it stays on the issued list and in chan->desc, the cookie is
never advanced, and the channel does not move on to the next transfer.

Complete the failed descriptor through virt-dma instead, mirroring what
the done tasklet does for a successful transfer: unlink it from the
issued list, mark it DMA_TRANS_ABORTED with the untransferred size as
residue, hand it to vchan_cookie_complete() so the client callback runs
from the channel BH, and start the next issued descriptor if there is
one. Reset the retry budget at the same point, as the done tasklet does
after a successful retry, so the next descriptor does not inherit an
exhausted retry count.

During removal, kill the producer tasklets before the channel BH so they
cannot enqueue callback work after it has been drained.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index ca60fb46ade0..992f9f103702 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -326,9 +326,21 @@ static void sf_pdma_errbh_tasklet(struct tasklet_struct *t)
 
 	spin_lock_irqsave(&chan->lock, flags);
 	if (chan->retries <= 0) {
-		/* fail to recover */
+		/* fail to recover: abort this descriptor and move on */
+		chan->retries = MAX_RETRY;
+		chan->xfer_err = false;
 		spin_unlock_irqrestore(&chan->lock, flags);
-		dmaengine_desc_get_callback_invoke(desc->async_tx, NULL);
+
+		spin_lock_irqsave(&chan->vchan.lock, flags);
+		list_del(&desc->vdesc.node);
+		desc->vdesc.tx_result.result = DMA_TRANS_ABORTED;
+		desc->vdesc.tx_result.residue = desc->xfer_size;
+		vchan_cookie_complete(&desc->vdesc);
+
+		chan->desc = sf_pdma_get_first_pending_desc(chan);
+		if (chan->desc)
+			sf_pdma_xfer_desc(chan);
+		spin_unlock_irqrestore(&chan->vchan.lock, flags);
 	} else {
 		/* retry */
 		chan->retries--;
@@ -601,9 +613,9 @@ static void sf_pdma_remove(struct platform_device *pdev)
 		devm_free_irq(&pdev->dev, ch->txirq, ch);
 		devm_free_irq(&pdev->dev, ch->errirq, ch);
 		list_del(&ch->vchan.chan.device_node);
-		dmaengine_kill_bh(&ch->vchan.chan);
 		tasklet_kill(&ch->done_tasklet);
 		tasklet_kill(&ch->err_tasklet);
+		dmaengine_kill_bh(&ch->vchan.chan);
 	}
 
 	if (pdev->dev.of_node)
-- 
2.43.0

