Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725300;
	b=BT2sdTLtA6p+bNz0O5VbqWFzIxmLeuqNxYZZx7SOQ119ak6Y8icUmwrG9NWneQIeROrG
	 WzApUbocdc3n9/Rso5Yd+5uA49hn923s0ZjXr63/NXi+e9/jqO10BlDE6+KqdAUOH1ZTD
	 rmxQLs9Ek3J5sOKQFD6DnhicE5wu2Tt/wfA1odtigK/dblGXwCoJccY3gHv6YTa2lZOCP
	 9dB2dzQSJuMbiel+GgCSX11eeDDXNA5WPlI7GKiUUee8PtLiyT+GVePrLGX+5/QFmHcGz
	 7LqxfKWXsxk1XbAoyukTw/QoUWNjyVG1nj8eKzP0b+0ZijRH+11+KcXeYipMO0CFbbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
	b=mxORlsaBF80IBaGZPDzPU8IWmqM4Of1CR9Umxpmjnpa54EwySnO5R0/sgC/YYG7ZoObO
	 at4yGzSOBGUk9O7aBfCZ70hBBISxUi/1u1Sj74RALa8bmvzI2Y/b7xTmrBRxXLj9Vb9q4
	 RKF4rUlGKfCOZS+AxZiDVHb1fK1DZVV3Ys1KrYYCIUT/ZFe7aNVlF1jxeouNyT0WRBu8G
	 73If4TGfkh6Y6qqVrJoGYaWoFk6joQ55ODxpNrd/cJo4g7hTaUfAPTzsyDct7G1gtK1WC
	 6nYjnlpQKT6Mtu4suedt93mYj21/QqYK0WK87GClijmeyXc6axKWQKGVYx1YgxKzB6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FSyRO3Jm;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4A9606A32A
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 03:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB4A9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FSyRO3Jm
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6ddef424972so270141eaf.3
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 20:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725299; x=1793330099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=FSyRO3Jms3E9Jf5Dvp+KldFAHs19x0a+sFC/yWDyB3yn3kmGAue8c2MNODXgnd+1SE
         Kf9iKg2wgxcIyrj6joHsbP5FxKhYPs0dsVywMuUaVGjIbTR6kfXSBMgLc+kHGHgyEnwB
         T2LGDmzDdsJGUaue5PPUx/8Gqulcr5a9xlYQT18Q9MANOrkCrsjqzYIQqo1//UJ8h6Ue
         mQ21DclioF0qM1wDcIUIDmmDDrOMXIU6aE/TrK/b4pNfr+qORTJ+E7DJIigEcua2lpb1
         8as7S4Tn0my/DkJltl1xKcBAVAO4/owwBfpfV3wSpoXNR/SuIthpbwOdW0KVpGuhBwZ7
         DGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725299; x=1793330099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=K3PFnQ9Q3ThSt1FIkJJWoEi9Vc5QvKsy9pjJx5YtzT+GzKfEgPjlpnfFVfF6tAoW4P
         0+WHX9+H51jqVTrZpfA7r6SSxHXTlaBaNFE+yyLN1LVMpkwLvvP76CRYrH+uchlt42Fa
         G0HjlDwWRcMM1UXEKtzeqSAvPar5qNnRsj+21qTDfCLmTu1aCuhFzd+ezaniOmPB7Mju
         Ogf/cseCEp9CwyaELmNrpYTb4FuO5QU5qme4w1fK1Xih9ZEtutphiljpnEUVj1sdw16w
         dhUKFKJleDU6ZvwMK4cBQ3uDxJOex5dENlA121Am9Lsh6av63MrwcJ+zxoEidbQeiQMQ
         iqew==
X-Forwarded-Encrypted: i=1; AKwUvBxCVf7ZbcND2qp2wI2HwXLjsdF9SASdzL32BNf7t5OY6GPNkBS3XtJM9RuAS2pB0lnagtbERvTPMTU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ24kGoWgbMuhrEGMLOxE0mRydTKI0N8F5UvjMnfstZZB5Tqmai
	E92QbAbgbRDglOAhhLc3WHvjUsOqEIo5gcFuPIZYom07w74Zx7FHKQ5C
X-Gm-Gg: AYBFou1P692aOm6P1/i9r2NIVYDC6V4yJkTvAqTXHDSgS1I/zUr5lY+079QcPsZQds4
	LjNPK1PzNYtHhxD/CqCibFyhhVNbyYRyknf64pSGgnQunY2FauKyQ/ftpFw3YiGpDrNyNvPf1Kp
	sAH+48Ddq1HAP/PRhs9bVZ5hwABLJnvK6cUckyEtEkg5SPqXOLhcxYVBVGbldALNNRjekefnMiL
	95gxHGqGWqS7LB4E6rDyTlAsjezZXTPDZzuY6ei5pb4OB46RptYRPArKNfl3n68ozoW9ZEZ3z+t
	e9NhYW1Cklo4PSSeSVlZs0jZ0OV9xXzbLmdn9bJrtMoxrfD7gHz1SuB9TqQrAUbcDPvTdKmneDF
	Eg2Z4njv6UuAuf2B/2vPLPHuxTZ0lrUS1FI2hQMO7mTbOkfGU5g3qzVfWdah0IiuocT7LPB3R2h
	57QXJM+oujK7Pt+NTLa8p0DR4QZjwVl9YcreMiAprzbZECrslr85pmuEfqc4rJT7WXPhjzeJZuQ
	+wQf5/p4qMOQguwUDeduHKwJ5g5MTyAft0Ud9B2pdKbRxQwzFUhe1h13FJwwCVlACMJiltR4sn/
	ngi0vC9TZAia5OZ52GOt2DYHPXFrh4VB9ll+KtdeLVlgcBAQtkzVWz2ATr3gWdHWbVUbFrINzD7
	MgR712ko6zG1MGMHsBFJKdcjBLcP6Onp2bWCfc9LotfDgQZGylVPjqnonZHZb+T4OW9GQMeRdPV
	EynqQT
X-Received: by 2002:a05:6820:a013:b0:6c1:f38e:7053 with SMTP id 006d021491bc7-70b8880e70cmr711138eaf.3.1792725298780;
        Thu, 22 Oct 2026 20:14:58 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:14:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:52 -0600
Subject: [PATCH 1/6] dmaengine: sun6i: fix physical channel index in
 interrupt handler
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-1-01085f684c9f@gmail.com>
References: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
In-Reply-To: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

From: Hongling Zeng <zenghongling@kylinos.cn>

The interrupt handler iterates over register banks in the outer loop,
but the physical channel lookup uses only the inner loop index. It
therefore handles every bank as if it belonged to the first channels.

For controllers with eight channels per bank, interrupts from channels
8 and above are routed to channels 0-7. On A733, each bank covers one
channel, so every interrupt is routed to channel 0. This can falsely
complete descriptors for unrelated channels and corrupt their data.

Use the absolute channel index, calculated from the bank number and the
controller's configured number of channels per bank.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
[james: use the configured bank size and describe the A733 case]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 8752969366ff..9d94a37fcf10 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -603,7 +603,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		sun6i_write_irq_stat(sdev, i, status);
 
 		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + j;
+			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0

