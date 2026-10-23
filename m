Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798714;
	b=j+RucEtFEF42DVlCTjZjP5VkVvQYggMJKCafam2Q6AUglQTKCGW8o5AgxSIJSSjrhKKD
	 55YfBxHHu6LZos5lyJptBsIJkl4d+5gaanwmE8IZbvUrbngVwvMkAjH2V7L0hginuiVNw
	 zcY+8UMAIJjJekx9ECCdmFebWGX8P0LTqNLvd3OG19bYeqOa//Y/z4U01V9+0sxAMI2nd
	 kvFFGAhRdvEOymzfytB1VIBA0H+SvFT5tOr5cA1ItnMMaM/PLiwxIzZe2Jr6RTAp41lld
	 CXQe3v/zW6h/29bhPcyVJCsenF6FrTZVvUaGM6ivx15YtNckMcujrMiULnJF3R1eyng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
	b=BihiCmwIeNKhve90mSqYuJzFuRKIIPZ7VfQyTkuNyZD/qTlWcoL9RZOBuaOBTidVlog1
	 cSoXB+ghqQ/+oHhrU9Ekve0ZLcYc1Wsb/41WpWdrES0muMUfEeYO53rfQkr52iOtE0/Lz
	 xUQMPwdsqDciQyh1lQYazOgXRabroeas48Xvtk+q6Xw56pEPrxvssAM5WZ5FG+KSwVaSi
	 KM6gXKEIXp+dGpOIGbLt3mLpOqjkTX8CsHkksD8eIWerrNFcehaS+xN/f/QvRdQ9zKybi
	 4ga9WZ4tgmrY/FyUGdwYLlpx5BJgpZUqZ60B6IuTOOGk46uNxnMnAF0MjdE96VIImew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P4UAn0Ic;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BC0606A325
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 23:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0BC0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P4UAn0Ic
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b190cdc9feso784269b6e.0
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 16:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798713; x=1793403513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=P4UAn0IcmbG4TKPL5B7PSEMxE/hzhWK30fdwhR1zlTmj50+x2j5tC0kkR1xTzVhsZ3
         cDnNBiO+Oy3rkR/NwqgWSQoV0UHc8YPQk6eNsaEQh6J4UMEtastpUQE1Vu/ylyOS2N6G
         dteJ1UBlzz5Xfuktw3yReIkvPi6sFZ8zvUaoTfVBjoAopXYHAN87/HHzryk/yWJO7X9Q
         MFMF+lArsuCIivGt/trPKNkb5fItEgvfH4ehlrNNdTQmWFDA3WH8lcOKQDMvrQaMuuYR
         kKETWRd+LOdkb4qaOKlOWrVc6so7NJz7nNePTuHLlqMF8T+l9GeviN6pN2y0ewcDb5Ws
         T+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798713; x=1793403513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=hznbnn3lDBcvJxeCX3Bk684oCNJR5zE7MOjXdMO3i1S+7IIV8juIPrpAJIkEp8LZll
         nubA05eB+R6E0hve0zcWwvnjahvoMXLvLm+44ITiXbxk1AwHYCCdoU2+/v7fEWW5IEDI
         fVl5yL1U+T+krJPu0pEYI+yBrvP1BZIbj+POLH6qkcqq4MvBnThiB/kiSRyxq9wMTihJ
         0JffvjhZuceHHvwHi/5kx3p6AYS/oqYr2v3nnABqeJwJwpHtHcO/abxOBpCHD/qoHcrx
         IEiTYrHcBGoBqm6WG7LTlCkMu4sW58h7B23YU5BjEli6jyisvcLFBg0y7EVSjgtCejaW
         PG0Q==
X-Forwarded-Encrypted: i=1; AKwUvBw92LGEC9xLfnoPmBiuPTe/a3zCmOhIISmZXS85W+NKVhINMi4nfKmL0lZTnmuWF1JAgfih26KXnHY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJThy0XNz5Iu2yYsWmuG9YwtcqyBHCiB3VM6+zT3XVp6ltjFYSA
	bFNfzYbp5XzLGGht7LWKDNZUocS17b4b5gQpp5RlGq4nm910lgRtPFQfn379IbSF
X-Gm-Gg: AYBFou2Sxx/9Procs4bQDmwcYi1GRJDL5cUJGYZDfmwSSQM3G4agP6ytqUrntYya2bu
	oUTi2iEC9iuddLJP+rVVzCN4W0vAiyOFTx/eftXL1z1bnws596V2Wk37JI3qI0tl+1wzDBV2Ub/
	je1QWBalDUzPUzHlQe0PHJIA7JFIomnwyw/yssWoql4BK1iMyxMZtKvLXwhbpOh/hBH5JsMpYVi
	P4C/nCEKfei0y8YSBPR8KKWJWM65n3bDwDZvIF9ytpvOBdz3s28vTKu95Lw7xXbhoVg0k560l8+
	h5Oe8Y6srRgCMG+nF4kk3qXiH7k1pjfhbScXepO8bIMjpr0YsiGG5C/OS4F61lqoHsTQpIz5JLL
	1UI1hBma7fpN/kskrz9dMOK7ab2neTWVV32Q8P7dTziQZ7889fWx4aA+GD0tg1hs9rkMGu0eMBU
	kda7jkqGmhJzy8agrLuOpfgTs6u/VReE3O8T7/AzPZ6tXQwoGZEdUVC1Vwoo/ehOJJhghUtMLZB
	UpKj5EN/fwsgjdeAXIsNJ56W5i6A1Y5BvP8OqQK3sWEO7qkciq2ZRHHMZ5D9XTVWQM8dCNQR1pv
	+mPLDY+AwMFYZ0Stm6zyce2XzHVAhSaHPkYpVMgYYi4wVVtvt41tzukvJPgTMzB5wHcEudIwmTW
	PtjASuSq5kpOeMFR9gtslG8zsdY9Wfs6wMZL9QGg52k9dK86zu+CnxXgbIRCnSU4zYVG7sKAeAx
	vAKbI=
X-Received: by 2002:a05:6808:c1b4:b0:4ea:b0ab:b753 with SMTP id 5614622812f47-55c0028c346mr545139b6e.50.1792798712613;
        Fri, 23 Oct 2026 16:38:32 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:20 -0600
Subject: [PATCH v3 1/9] dmaengine: sun6i: fix physical channel index in
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-1-ef1acb0be768@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
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

