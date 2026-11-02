Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648070;
	b=P/WdwBfHhHx52OZm5+Z679pbExHvc6VE1Zur/6IN5H4Cs7DqFmNK/2dICG1Y1oXObiqs
	 Uq0sk05lpWN4HsMrYpHo9KAdCKGCF2Y1gdm5CcovLIRwklSvaOaicewbiutF0/ut/yjf9
	 K2ydOTQv/i4hD+KYvWR7fa3qFicr1RPx4pyZz9JIjsgcNOOKhjlIIVTKpRB3ah4av6IWD
	 s6obrntnfBchXLX9rc2C2YGHhy3XMsmtsmudVvGgjKcaDqvONwDf6w3GYMoQ9FZ63gQgo
	 RGOyiaH6jLJ3fSzxcTjuUcpRLMNfbWlt9CGUXu4d8Ip7sOVU81GLmKMpF86vO1UDD8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oUn0wNxtDa8bpouBdwU2UFn6Se8GBim30o0tIkBNdNI=;
	b=YtHiCZgyu6TkGanPsYDYDiupWONgPk2FxhWVUTFCc7d8JxvyWYhNABSBb3QPbdkHxsL7
	 V/xijWDkcQ3qh6CAqCmlWaFg2fiDVShSu0Yq7D1ZbbLwFdofCoYX/r+EWNBwc2mt6R13E
	 W6IoDu11rajcwK8tteuDa6eqC8Im45c45xuv2oCmIOhWB/8xZaxb7m0/5dOghNIf7N8ZS
	 axCOsCPrPtoaxhpHS42W6IJvEmit4+JnVCeCnxoC4vwlb1qE9DF7ihRh3SNneNBPe8hqG
	 qFbiZYDwTn5rtGpuen+052+6rgs4Wx51AbyWe40LBwE/cA989vNOsIfm4VVtugiU4Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hhM0ad6Q;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B866082BDE
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 19:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B866082BDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hhM0ad6Q
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-5641f26ce05so1491900b6e.2
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 11:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648069; x=1794252869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUn0wNxtDa8bpouBdwU2UFn6Se8GBim30o0tIkBNdNI=;
        b=hhM0ad6QHyVqiEjyneE0zJvRxpNSObqwc3qxsOSrjU1K3PjqHOTkJE8dvYU9YcSNK1
         IxfVhKRrOX/pGJ7bnvR5Idy92TGHuqMJ0oGG5Lw3MYTIlzG0Cby65e1NytNHwrL8kbYg
         Harw+Jy6aA4WPDNsRmZqRODsgdCvqtfuoVAPXtNmMm1TnPOIb4AxPBEapIpotaR3m/wl
         gX9kAYscBUbUh9ez0s1LdrK1rajxcPWOxFL6fAk1FPzapf9UIZYtU22UvCZCE5k/Q9/l
         EZT0x67FMSUvG2akiUPyNUqMwCBz/Did+1cPHcD5B78z5w4481VQM8MKhgrj+z3FgJpV
         utXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648069; x=1794252869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUn0wNxtDa8bpouBdwU2UFn6Se8GBim30o0tIkBNdNI=;
        b=2Wxhmb3TCESZDX5VUhDIbuvAbCFCzVJN/3ZjyPEAmlr0tAAdphuUDnut5JRba07oIm
         gthGtHrcejMODXHJNaOEGEPy70xSpac0RHM7XzHsqnFJr+ah++XyLxNAudXwCMTc2HS9
         6jHhUUn60JkN54i+Xg4cc2ZDskv+5SOExNyRid5LKJ9rMD1pAQyTmH25IadE58M0iqoY
         BPR4Kle+N9QUgvbsu86JN82LYRbLUDUmwiPvkx4z+IE6oGOEl81WQ7i6JkI9gzxoCqDQ
         xQY1Sb/0avIucypsebdpFQLa0dB1JUZXM5jnfIFzN05VKXqpaefnXME5+30ZChk3kTam
         Lahg==
X-Forwarded-Encrypted: i=1; AKwUvBwnjRHCYNoH3o7t5tw90JvdDdkB8xkhHZVFGTfQEEHik9ZEQMlHIb+m1A9aKcApgsVdpNGEfJQnK9k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQsmvCGVij+DZaV1H6paoPbYsRdPzdc0U8NITCTnfRLR3/qFK7
	6+TeJ/YEer1VwPRVMbfVGEXxFR5eWkQTdxS56GoTGsLqxeQGQcVUTDzF
X-Gm-Gg: AYBFou0IPnjmorpPBKSxA83LAnYZKU5+yh6kVuSWG1IXYU/Gc6BNbUPNc0kDpZFFymy
	tEEdoxnUns3E3I59SJDR2QOIIKrOqXUyyRHtS51xzlkQH7RZc2K3K9HdGCh+JykqGuHe/5CdocT
	l5UA8HtjN1Zo2J21+hYDmK+gLptrt7zbyfcLQCH92RGzvFyrdggPYRalxWQQa49jRqBhH0z04z1
	2MrKezwqn8NlH22FJ3HLnJWiAHs4GAG4NkG5Zd6NoZricygyD67X4mLvMy0fbjkgRAI9JaZ2H2A
	e2J3cvcb6hwr1kY7TOzTdAeY/T9tV5S4fulJtSxsxNIco2bu5lnUYThJ0Dt3q46d6F7U65UvSo+
	PTbZsF8TW1GJvIkbcnt4LkTNORe6M7ogik4qSS27qFLz/7heOUNxg6xjWd9aaQJcoYfdFn8NojY
	GFl30OoBkC0q408MBrMsaIbluntOhEOalYxu4gqchQA4TxSfvOYu+us5QIJxgX/tA/qx3tokGCj
	H6SulJesTD4e4+777uYa15o05DnmymtdqtRNHZfeng/InJqeR1EKnje97OrRiV9bQlGov17wxj1
	kVHTT6CWQ+pEPP0Ux969gGHrFcIr+9Y74TvU8+6FgLPA6EJvgtvf9dcDAHvTW1/YQvQlgvVvF9C
	r+Ega0LG7zq2SFQikGPsFyEuS1LYBG4ysk6NCIt+Dk9Dx4Lqn7RIwhrc8t754+y3CkcrtcRk9WW
	Yamy6rVkrdcwhyUl+1qwAUD1xb7WyYjVwnxusZkbFN5UzQaKIe+cU=
X-Received: by 2002:a05:6808:5395:b0:55c:836:5955 with SMTP id 5614622812f47-5640dfcca02mr6963810b6e.44.1793648068831;
        Mon, 02 Nov 2026 11:34:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm8558249b6e.3.2026.11.02.11.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:34:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:34:21 -0700
Subject: [PATCH v5 09/10] dmaengine: dw: synchronize completion callbacks
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
Message-Id: <20261102-submit-dw-dma-synchronize-v1-v5-9-d3207758fbf9@gmail.com>
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
index 339ca85952fa..6371b9156882 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -897,6 +897,19 @@ static int dwc_terminate_all(struct dma_chan *chan)
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

