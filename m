Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648069;
	b=gxmWHM4K/jJdw6omiZVza2bsl0iYP0qp0OKnkXF/lXMnAA0+abgsgoyjrSdgyzf6Csvp
	 SDDGUr3dM8ICH0l7V0IR6Cb+ormdFq3/uFOU8D7G/qP3De/AGa/dCwVNYspui1owDrYlD
	 wlS6QS4s4M+IVjD+dQU2Cuu9Dz1T7O7GQyHk0QyysxetE82iHfjFs5Bwo0o+sr9Jv+Vhp
	 Pzq9AA0nxNWO4iJEPazl9/j/bUDY5lyJGuN9c48PB0gfoE7E0ooFvLmfua7+EwXTx5fOr
	 pNkwUU7Bdk9zQ31CJEO2qifppnUPX6z2o96OLWWlupi0K8fkh6nxNOpLU9UtRh8zNbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=E7gBCzFYvmg/wm0ZG+Fa6cYfj054waIZVNwZet2Fyzo=;
	b=qLy08pwY3wvZmzAYl1dGIcwtN3TzyhVncFYChtmZHmFa6f1ZeqiM3zmulMrq41VcS1jK
	 BphjlAvk2ACoRSBxHZ9JhhnXDslTKXqbUljm2ZM0LpvRdboib42Gur7bYMymgVLL2VgcP
	 7VJqxY+HFM+kvnsCz67wIwuvOsHbyNgG8Irg3qyzeC7k1xg+SwFyXfndqHtgKOurKLRMs
	 WTreoXj2M5sVxjAifkwxGgma2jfX1bEwrotvSvdnACsG8Y60SOXplTJPcuqBmewLfsBSW
	 VLqxDXjPhJwAd0wrqlrtC3pGKv15jnbj3kwD1fOfV0PsA5vtlhU8dkCnaKC+BHReFVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XxQzlu+B;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61256082BD2
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 19:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C61256082BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XxQzlu+B
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-843a4ca671eso1557111a34.2
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 11:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648068; x=1794252868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E7gBCzFYvmg/wm0ZG+Fa6cYfj054waIZVNwZet2Fyzo=;
        b=XxQzlu+BSk1rbUr3fSK3jJwHiSV/vHO2sI9CexZymuWrVQVZFQ5EgJ8lB+oxsZ5mYI
         gF4lxzQn6U4UwVH6JjmVsogo/vmycOgclfKwkcy7lJZ6uvB64287SHnhG/a1mAxBKW8e
         eTjFzmR0CMhp8EtpV7ENV2FNhhlltgGPghxnOcxxQrXs/h+YFYLCljA2Awr/OA7ZxT82
         OcpOFy+Iyv3HB5m41M2hP6xB8cpbWoO0dVTGBE2D5tk/RXRACcgrkbcVZ2Vb8qLQCI5H
         Y+5NnRzZfU028nkHnxKO0pre5/Gq/AovnbqE9i4+F7w1YSKc6Beh+0VKrJWiXNAimo2L
         LHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648068; x=1794252868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7gBCzFYvmg/wm0ZG+Fa6cYfj054waIZVNwZet2Fyzo=;
        b=zh7hBIqsOaCZiVzKFGVBHKjz+v5I4VnuCqi/DV4Fc/uK6kJysEM8s2cDnKCAyay5dN
         y+m+9MDoxPMGUruYBd9rcNmKMMUFJ83ZC6hoQ/lM4/uJUoTElPyJeILVomdhhYXrlpS4
         oh5M40UROoujENaxlKMXPsTJBj/Na+qvuHW2zwkzMwXgfozJ4bqmQ/4RU9kt9O4JLzxm
         DVE7/nTYwMmae39zVwuC0PBn3YNAqRXr9Ao4nFGl2SnrcdKKmcJ+dZTDpK2NhJxuRec6
         up+2ZPL8Q2NZnKtQ3rqsC/JUV9FfmS56YCnm2PpkoOmtMf0hvvv2yMovQxLrIb6FANmB
         0cEw==
X-Forwarded-Encrypted: i=1; AKwUvByWSb9es+SocRhdYBbwmhX3N1mc6b+B9lhThP8aFjmSJuMStVFGIHZpFuXzd9YBmFWXNOxMhYM1FyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKY+XxCtX5C3NJlzmARynmJ6SZjz26Twrn+wZRqzBjdNnvi9c8q
	MaQK+O78dW5qMuXeAh1B9l6lwASjrSvpTlna4Bw6q6r7hM2RmXudyzLs
X-Gm-Gg: AYBFou2mrw7mu7ZV3ZXKnTh0AALpEvOdTtqmnM6pJNGo9VvOhE3PAvjLVJpFxwp/3+B
	6VeQiE4hQyrq5WZnxD52wsdhqeem0dQFVKZJWwzaHhxRqMoI9CfcwA7B5Yh1w9F06UjeQSsd0m4
	mWrEZIbSX5el5hrseQbHF6VI9J53xYPPWfPRYMC8EhJ7DcykBgVwvWyjPoZrjqvXYr7iy1mfXNz
	rsIbF77TGgCZm82cGvydKe4dLQZR20ffxK+I8ApnXb3WkgrpNIN25fyrasiSZ6bTXky3OhufyF0
	Gu+7yl83MCArP573chh9Nuz+AtSTt6DoYrv6VkkZdqtqjo3ZZFatBSatnKAHoUR2sOL6QFz8IK6
	H2bI7kUITt7SkGxaosg64BkXp0IC/S4U7i3MfzFJ5ulBdhkpW/bZaZQIKENcilaaapkmS9SH6AI
	A8BGO85RDfXl/p17t6rcIF07LXdvzCRE3ssjRWyaT+z/SVmi9yCpkK3PtvWWgp5LIQ5dY44wy3x
	P04W++UmlUPZyZW9UlQ9njuP1jcrnSE4kPXTFPF/3BgiYY51wLnijt+XYD5SIEJxjcum4zapb7l
	U2J5nlQwMk3O7i9iA8JIEQuWyYfC79noPoTNcvMWY12KY0c1eFQsUBOwgF2lDOPTOhSOsCAXqzA
	EQtkC1zpbaT1jHXOq64+EhS2HU5yTKv29+nEewwySAJT3MLwbKlnpwXeQQ/kitoboBkUbsJPKyV
	zwsueopJAqeKAuB0cucobCgi9HCbSkh8dZgtReMivFQBBA1YxsJy4=
X-Received: by 2002:a05:6808:f13:b0:4e4:627a:e094 with SMTP id 5614622812f47-5640dc2c8a7mr7309751b6e.11.1793648067810;
        Mon, 02 Nov 2026 11:34:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm8558249b6e.3.2026.11.02.11.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:34:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:34:20 -0700
Subject: [PATCH v5 08/10] dmaengine: dw: drain the tasklet before releasing
 channel resources
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
Message-Id: <20261102-submit-dw-dma-synchronize-v1-v5-8-d3207758fbf9@gmail.com>
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

The controller tasklet invokes callbacks after dropping the channel lock.
Releasing a channel can therefore clear its configuration and disable the
controller while that tasklet run is still using them.

Disable the tasklet before clearing channel resources and re-enable it
after updating the controller's in-use mask. This waits for an executing
run while preserving pending schedules for the other channels. Have a
pending run return before accessing registers when the last channel has
already been released.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 0fd49ff9257f..339ca85952fa 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -393,6 +393,10 @@ static void dw_dma_tasklet(struct tasklet_struct *t)
 	u32 status_err;
 	unsigned int i;
 
+	/* Channel release may have drained a polled completion before this run. */
+	if (!dw->in_use)
+		return;
+
 	status_xfer = dma_readl(dw, RAW.XFER);
 	status_err = dma_readl(dw, RAW.ERROR);
 
@@ -1062,6 +1066,8 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 	struct dw_dma		*dw = to_dw_dma(chan->device);
 	unsigned long		flags;
 
+	tasklet_disable(&dw->tasklet);
+
 	dev_dbg(dmaengine_chan_dev(chan), "%s: descs allocated=%u\n", __func__,
 			dwc->descs_allocated);
 
@@ -1087,6 +1093,8 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 	if (!dw->in_use)
 		do_dw_dma_off(dw);
 
+	tasklet_enable(&dw->tasklet);
+
 	dev_vdbg(dmaengine_chan_dev(chan), "%s: done\n", __func__);
 }
 

-- 
2.53.0

