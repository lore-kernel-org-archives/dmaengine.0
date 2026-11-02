Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648063;
	b=YgKm/JRuVGDU5LmmejHxdYGnbVP6cOFhN5XlyAyZ3nlGBKjT+O7MCORdrHhFXT3tgiXb
	 9EImP543v1PUNGBtld+qtdQ9jH+bUzSv/pkZYQZku4K79eYuqkoraNvVAwOwqbs78l6Bb
	 JFVosjcBmgfDv2RRKDpebhGTUjjhgtZz4NLY44PHX85x9FrgkuZ86DT6tU5dDIe07hDhK
	 9bK6cKmUX1VDV+4sANM6tN7DuoGdTSioc7LDBGsmq2aTUjRH5z5gfnRHmmxRirS6JhvKY
	 TtXG9gomGA3+/NRX+ke6U2wajgXHzHG/mGSiQs+En00iIoJmw4bd3v76t7o4OFz7vNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=clb16rj88aJbTcdYzcJEuHREx2BavzM+wmqbqo2G9WA=;
	b=CsPbXpaA8PNSOQnly+Dyrei7CnUObWKHNrdSQsQWsTdPfbougJZOihaSFdv+wlWcU+NF
	 jhGJe8BL96cSriOvE4SoELr1sYkJWJ/Z7WEBSH6uVdw8Glg80a1T7UuMm0h+/q5rWtFqN
	 ZPphNGGalafaY0IqjTf+ykdiPC95baTg5cGhnKRRgeb4Gh154ISODyaOV2LXpgl8LevZI
	 S8D7r/ahENhQc/1b/mpSkXHBMJcDlT2/CrFIQN+OI0C0cCg9EaOpVYOLscNVq2N4hc3s3
	 erhh3K0p5eYUODl7iz5NtVmAXPTTxSqWv8NpUOb6p5BCNtiI69neZVItUVeaRynojHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uf0KrYoO;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738B7606D821
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 19:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 738B7606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uf0KrYoO
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-83bbcfba0ffso2576479a34.0
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 11:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648062; x=1794252862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clb16rj88aJbTcdYzcJEuHREx2BavzM+wmqbqo2G9WA=;
        b=uf0KrYoOZIGx+PEW6J08xmJsV0DaUkL3TeViGjdoLyNBNJ3rOfiqa6+EEJwmjpA5aN
         ujFa8qwAYYAkVnazWyU4d6vPjmJ42rV41SJ24cWJRYyj++hxfHLg/NVwdNCY2NzRxUjX
         v4EmSAyHsLtgpiFvLgXlwOYq+s0pbvYhpP4OJaY+Ai9wZ1qyJaBTG8nfVkAxSPqz+49d
         EJPoK9m/5rpUHo89vkIfTPPk/LbH7mbGLRlClVCn1m0svzIOlzdVc6DLxwwPMEmSl0XQ
         i6moc5xZqMK0OqyZbpWB9ZG9Vo/W4mcsYmypv57fbCV1xmAsJaFG3c/pujNMIHZRkIak
         JFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648062; x=1794252862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clb16rj88aJbTcdYzcJEuHREx2BavzM+wmqbqo2G9WA=;
        b=OEbTIqcVSpzVnzbf4M3SxonKuXmQ6Pb33Kk54Cm3okNeGvJ7dAdMvbrYlz6zKCz0b7
         fB8nRWFP++etZgGfEVLE9KJCzTLrnbfyqYQJrodvn/TfYiHru7PCbyRjba088mMGJQ4T
         +xwiltljoqF84KNiJEx0OXEAFz/j7+lEuk2lDmlogjnfN5IyXxNlEaAtmbTBntGqgojk
         YDnQ7aLwKu+BNY1RJgy7FSvOxUmG4qLOPnySuguyBSHNNwAtKoDeLpyb9HjEJgZGbro2
         TtsgM6xtouZo6RkEtXgyW8wcDzCc2jsVi5+1c8kHBpJZtO3g17Y5mvlKvqUctEKRIDjE
         KNcw==
X-Forwarded-Encrypted: i=1; AKwUvByiMVBmI8e7fc3lUAObf04ZXzOlTF4dIC4b9qWebDnjseGKdiNfiVVlpchbWvttwF7Gm4TC/OWk+Jk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUCxyn7/OaRdhFTYSxZMxYjO7bI1YNCvEEuc6hNL6fC9Y62oR+
	kNrGPZbTY2AzGbjGznFTHAmLaN64Y9WesTTW4v9pKsZYu8YH+G9AqTNN
X-Gm-Gg: AYBFou3MLf/Y9QhUaNW1FS2JNSaKzlDZYOreXrTVJxXKLa6JuotCn6VuKCwoUwotjl9
	DT1CJD++6qWhb3bPTUhZ7oDVumEz/y6Y/6b7UVSGf9lVDGt8fZlpgRLFVOSMCoji4NrIeNKyoFy
	lnzc+tcU/rwyGdCoU202VPy6zY+fYgq8bZXnCK/WDTvQSuijLF8lS3n7KQq4107JncQg9q3ia2h
	+ARAYNgUB+EmGb3nUD+D7Ve6/bv6VpYGKY5PLdlGMgqbHHH+xq3tbJXJsqqD1pMBa84qfvZ4GjP
	gawMBNQlTvBLXoOoWmDSX/VjBQv7FKggysqok/9NI4Gk6NzQtRouLra5oRm/MZSgCTibZnip0tE
	/I+iXThmBSY4fPxjNP3sGMb1ng1qUzZrY+GKmo15KwcILfW+n26bW5kK89mSJLSSW7lm7xeLU4I
	OCUbyvIuqhefw/Gr+8wTAOoqJe18kN8d0TZRUVwBZtN5UWBlGGmsxcogS5Des+xbcEVcSUQ/PA4
	BoqGG8jp7lJRdKrGyo90s8taYWrO6TtBl7p5y04eIhz2L/vPvj8DsTSR80/ax7lZbujPrbJ2pit
	QzMqmk++7z4UHwVa8sCv/HJVMyhPqOaJx4u6LS3H5xmfG7Wsgm4yWbyZ9eriUFfgR3rbdMi6hpK
	PZImOXLtTV0Mi55co7OME1OFnAzECJb3Gm6NCczHZ03VuUWPRgYC5tEeQZ9izoZXK8eTJUIehFc
	66/R61I250iYrxBWX72gG0GiG9aGI35wkPJa6OY/QmLhxalkFwZdA=
X-Received: by 2002:a05:6808:1798:b0:561:fa43:1b17 with SMTP id 5614622812f47-5640de03ce9mr7895795b6e.42.1793648062116;
        Mon, 02 Nov 2026 11:34:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm8558249b6e.3.2026.11.02.11.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:34:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:34:15 -0700
Subject: [PATCH v5 03/10] dmaengine: dw: complete cookies before releasing
 the channel lock
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-dw-dma-synchronize-v1-v5-3-d3207758fbf9@gmail.com>
References: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
In-Reply-To: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

Completion detaches a descriptor from the active list under the channel
lock, but updates its cookie later when freeing it. Termination can take
the lock in between and complete newer descriptors. Completing the older
cookie afterwards moves completed_cookie backwards and makes an already
terminated transfer appear outstanding again.

Complete cookies while detaching descriptors in the completion, error
recovery and termination paths. Keep the active-before-queued ordering
when terminating so completed_cookie advances in submission order.
Descriptor freeing and client notification no longer update cookies.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index f7ca9da5af90..2d69fab06601 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -231,18 +231,17 @@ static void dwc_dostart_first_queued(struct dw_dma_chan *dwc)
 /*----------------------------------------------------------------------*/
 
 static void
-dwc_descriptor_complete(struct dw_dma_chan *dwc, struct dw_desc *desc,
-		bool callback_required)
+dwc_descriptor_free(struct dw_dma_chan *dwc, struct dw_desc *desc,
+		    bool callback_required)
 {
 	struct dma_async_tx_descriptor	*txd = &desc->txd;
 	struct dw_desc			*child;
 	unsigned long			flags;
 	struct dmaengine_desc_callback	cb;
 
-	dev_vdbg(dmaengine_chan_dev(&dwc->chan), "descriptor %u complete\n", txd->cookie);
+	dev_vdbg(dmaengine_chan_dev(&dwc->chan), "freeing descriptor %p\n", desc);
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	dma_cookie_complete(txd);
 	if (callback_required)
 		dmaengine_desc_get_callback(txd, &cb);
 	else
@@ -329,12 +328,14 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 
 		/* Detach the completed transfer before starting queued work. */
 		list_splice_init(&dwc->active_list, &list);
+		list_for_each_entry(desc, &list, desc_node)
+			dma_cookie_complete(&desc->txd);
 		dwc_dostart_first_queued(dwc);
 		spin_unlock_irqrestore(&dwc->lock, flags);
 
 		list_for_each_entry_safe(desc, _desc, &list, desc_node) {
 			list_del_init(&desc->desc_node);
-			dwc_descriptor_complete(dwc, desc, true);
+			dwc_descriptor_free(dwc, desc, true);
 		}
 		return;
 	}
@@ -436,10 +437,11 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	list_for_each_entry(child, &bad_desc->tx_list, desc_node)
 		dwc_dump_lli(dwc, child);
 
+	/* Pretend the descriptor completed successfully */
+	dma_cookie_complete(&bad_desc->txd);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
-	/* Pretend the descriptor completed successfully */
-	dwc_descriptor_complete(dwc, bad_desc, true);
+	dwc_descriptor_free(dwc, bad_desc, true);
 	return;
 
 unlock:
@@ -940,12 +942,16 @@ static int dwc_terminate_all(struct dma_chan *chan)
 	/* active_list entries will end up before queued entries */
 	list_splice_init(&dwc->queue, &list);
 	list_splice_init(&dwc->active_list, &list);
+	list_for_each_entry(desc, &list, desc_node)
+		dma_cookie_complete(&desc->txd);
 
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	/* Flush all pending and queued descriptors */
-	list_for_each_entry_safe(desc, _desc, &list, desc_node)
-		dwc_descriptor_complete(dwc, desc, false);
+	list_for_each_entry_safe(desc, _desc, &list, desc_node) {
+		list_del_init(&desc->desc_node);
+		dwc_descriptor_free(dwc, desc, false);
+	}
 
 	return 0;
 }

-- 
2.53.0

