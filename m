Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744787;
	b=sDe87TIOGieAZXolHDf3umyKP0mS+ihVUz8UJsi8YYsK7BqvsNaAICznfWXOsenEBJIE
	 fBKd8XGj1KY8aVSU4CDRuIJJTko9DdavLFriubkO+NNI3Nw5gEWU5t/kwQ76fd1C1U+aK
	 7olJONILc5ENfmPkwbt43QlanMVsFn04y+a4AivNN/b/730iTTgYFvV2qoM2EyUq1+oVK
	 d3Qcck3ZKQq/V/2kVSaCWGId4jWY/1+0jIoL4e2cMr9I4QvCy6pMWEUM++V59cFMU9eNE
	 P+XQ9/SmLKKpgdj0CyYXcXk1k3RK7vOoGsjp7tO6VzTGRT8F5JHQKlwY5ptT142KuoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5OFiyLgPB9gonzWakO9Dintvadbo1GwHe3HBflThFw0=;
	b=XDrK+QBAYnygqFplxwd76grfdXmWuFNbxZePytfagHz9HfpP3/SWfGd3bwnYiPirgcLL
	 zYLucJdUDC8g/KgJgnSMrp9Hl2bdma0mVuq5aFwIbqBqR1xfhz4IYyD9L3IgblPSeY7s/
	 +Z7GFDGA5W18+Dlkzl/twdecqqAwfLhkJGFZMyedLgqDierXEOz4L5ffEQOdcTo4EMZSO
	 EGA3ABCLyg1sfL8TFsk9ZOt+ryHeOeF6CahH+AfbQyTsyX4fbDRHqbw0y+1guXr/TJc/B
	 1vCari9CetVO3GWX2vYp6GLAsbb+DyUAI/uaqxL9WbDRDTrEZ0QtetH2A1pkvYjFgRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDSEy2y4;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E8B606EEA0
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 22:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E8B606EEA0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDSEy2y4
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f84a55cc06so43567a34.2
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 14:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744786; x=1794349586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5OFiyLgPB9gonzWakO9Dintvadbo1GwHe3HBflThFw0=;
        b=oDSEy2y4mEoyput0d7HZH2+P/CQt1HWNoVOHRzV7uXjZRzBiBfrK280iUJNwnrPmCY
         adEdVT9w+OEfyqm1bRn66R9kzEta31zqSn7dNPQH6jFVbLWMMxif2s+pPcJS4lO7dy2A
         kftW40Lq0X8YxXi0eNL59JdGlQ2J2i/+OxPv3CG4kIzjhFEmGCAtE4bTDFm/9O+pcrt2
         I/jQyvzgpQBv+wW3bdk3UJi4RbfNKjpRSUt3ZeNM2EkDjiFyxPow152UY7BqlI1YMPao
         XYhHgryLEJuiNUgeVoHJOJ4Z9tEhfByrBlWvEoJeO/tMafA+u9ig6YxN4MwPEpdsS7IZ
         hi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744786; x=1794349586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OFiyLgPB9gonzWakO9Dintvadbo1GwHe3HBflThFw0=;
        b=y6WLR20hbQO74uq+/aiNlyJc4jC8JfnhuyRni7wabt6jCoVXHcepDkJLMSh+awHcXu
         yj62lohj66IkMYwE5vyZ1Q72OqTJlNwuZj+s3lfa7/nKXv9Tl5m00VpxBsQ6/xYq9gMP
         mLSYpqyB74RzwH03D6xk5papv31jXYPUP7u8hnrme4DJkrkJpd6Sr2mIhlHjgK48meWt
         xj7WWWwRhK6KsucpzvvkVu7eAKoP2PetSvh+L3zMnwSjFvNi1vUz9U5kKB4MegmXfmlA
         xLeSzi6CTJCHsf0NPG3bxZaHZbhpdaqxwzi8YOmDDA/TLhzIPB3zGLSbO44G8V24g4eg
         B74A==
X-Forwarded-Encrypted: i=1; AKwUvBwMX9nnh91VBbJuRjN5XYzSRl8QW6yuhTGzqVOm1expcMXLfB1+1s5ZoFgYkWCl+WBHiTD+ImAQ5g8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DWdSCM5w/yPvO/5w3rIjbW2Aq2EiA7o1pcBQdFWxeTEhCkKfj
	DLhtY/Z4GNuUATP9E4D2oY38hSzUplMNVD8LnfddyLEqaXQbzaRZLb9x
X-Gm-Gg: AYBFou0xsJHzhnIjr4ispw+/PNaRw9OsDvowGuFg6Tqh6CP4vUjD8WALNZ5i828b5Fb
	1ZW1CGIuDH5z8y7R7ucKpS6F3NGyYsEHPb+laB3Oimx0prXwk1hwn+pNLOYVMuV5UbNQ7/zG9wF
	VyGwZ8ZdFOOvGkDWnQtVEuEvUu9Nfx0pSbEnAZiDU5PTQ/iHoRxmYZfpdCchet8ssbtTYPcPniy
	5eiYxEQUyzVYKb90pAVUsUXZxby6g5w/S8y5yfLsTYpixLoDbO8TAU5alDxFEAk4JBRNTTnc/ts
	SuNCiLIdqlF/gKnovhSF5898e1Ho+t4L6vUdGiOpb6Vge9cc+w0Q0tHkP5+zI36YReX0hefl9X8
	hY+qzXv9cogsmLFvx5E+CdGJ/SU1E0ru5wMCqF7SGbYt50QLxYe4lnWbZ408E8+yWzciZ/Sow5s
	hhxG+JntzSmqAovIAjUzvkCm7icf5L1gc68EFb1vkt3MjQBtE6/eALTBFMV8h+Xl5c7BacL16We
	6QUHGwSbAcUqhEbzoT+Iol0jZGzlQSFf9VOovX63g2yhkZoOqPgjOR8KyjHEqoO087QbLteCLfm
	OBEpU94qmiTjO4TptI4NYDLrimoTlUmz2B3TDYIY2/KWBRwa1bY9p3STc3Q5Q49Sy7dwDwQF73N
	Ce2f9dlQttFJP/PGo/Yc1UiWkAa2uZMM2H6Em5+ELLVIw56t/FAIcHXe0vLzu/fRGYxkfEcPa3l
	7h9zvrNwG6misdN4UYZy8EpISYFtDn/A6Wmsw7EGLCIC43UZV9DFc=
X-Received: by 2002:a05:6808:10cf:b0:4f8:4a95:9b3b with SMTP id 5614622812f47-5640df9396cmr10547961b6e.68.1793744786246;
        Tue, 03 Nov 2026 14:26:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm128435b6e.3.2026.11.03.14.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:26:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 15:26:11 -0700
Subject: [PATCH v6 09/10] dmaengine: dw: synchronize completion callbacks
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
Message-Id: <20261103-submit-dw-dma-synchronize-v1-v6-9-2ee0c348224d@gmail.com>
References: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
In-Reply-To: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
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

The controller tasklet can detach completed descriptors and invoke their
callbacks outside the channel lock. Terminating the channel does not wait
for those callbacks, and there is no device_synchronize hook. A client can
therefore reuse callback state or release its buffers after
dmaengine_synchronize() while an old callback still uses them.

Disable and re-enable the controller tasklet from device_synchronize,
outside the channel lock. Disabling waits for an executing tasklet,
including descriptors it already removed from the channel lists. After
termination, a later tasklet run cannot acquire another descriptor from
the terminated channel. Clients must continue to exclude new submissions
on that channel until synchronization finishes.

The tasklet is shared, so other channels may schedule it while this wait
is in progress. Preserve those pending runs: tasklet_kill() temporarily
owns the scheduling bit and can consume a concurrent scheduling request,
leaving controller interrupts masked. The disable/enable pair leaves the
scheduling bit and pending tasklet queue intact. Other channels' hardware
transfers continue, though their callbacks may be briefly deferred.

Fixes: b36f09c3c441 ("dmaengine: Add transfer termination synchronization support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-180707@kernel.org
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 56a422ba14c1..6f863fae7455 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -923,6 +923,19 @@ static int dwc_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
+static void dwc_synchronize(struct dma_chan *chan)
+{
+	struct dw_dma *dw = to_dw_dma(chan->device);
+
+	/*
+	 * Termination removes the channel's descriptors from the lists, but a
+	 * running tasklet may still own a completed descriptor and its callback.
+	 * Wait for that run without losing schedules from the other channels.
+	 */
+	tasklet_disable(&dw->tasklet);
+	tasklet_enable(&dw->tasklet);
+}
+
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
 	struct dw_desc *desc;
@@ -1290,6 +1303,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
 	dw->dma.device_pause = dwc_pause;
 	dw->dma.device_resume = dwc_resume;
 	dw->dma.device_terminate_all = dwc_terminate_all;
+	dw->dma.device_synchronize = dwc_synchronize;
 
 	dw->dma.device_tx_status = dwc_tx_status;
 	dw->dma.device_issue_pending = dwc_issue_pending;

-- 
2.53.0

