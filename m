Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780965;
	b=Wy4JeqdO4xCk8bhMoeRyE1l0yMzWRLAWJzxGicydS6enn263znQZws5YKIsOm+n2/U4R
	 WwoIUhWYigZL5h7k5KKxGWBD/R9a2DUN1QCT2G15GKqHKTFFGHyU7bWVKxwdbYoE37+QI
	 Oglava6MKu61/wG72h07Y0a2p6++n3OgtTNZ0GVMvy8FIs9/JgpQKzrYDgEwQ2LaQJKWy
	 Mu/OpKjKSqbwTNqWmDVCXm0TCSyH7TFM4hsiAK3RlVMy1F0LtYD4dMveTJSBQub0N5Wlk
	 xspp8Un3dPpDqJ0M++V9sVx0939brZAH3X1yPKjEam4AcqGSt8h6x471SQQPiZDTLkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
	b=edRB03f7BiGsRPk4fO59SyL+eiMm3ZIA53LtYQO9Sh8ZMuHQAXvkPX8xK+gmboQNbZNv
	 s/U9NH4Mx6h0+dg++R2Y/Ov+JneUhtO2xFYpqAGzZgBCKW/Ck6S8fgJDk83ByGNynqA3l
	 jngFDhPdS+JAclPTEcZ0mw6ivzI18ewPobZVP+2wnPxbKzznWkifpYADVLQnlzrQx+86Z
	 87eXj1snxVfMEkAptl0HqFeLKXW4VIkk20GSIra2Tq6jIplsG145o9K3hVvJBlzpQjOkg
	 hb5HNua7P21xBbJHIkdGs+p8a45JCSPUEdQqGhWS/6FYGP99kn/EbknlpwwkItCo99A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=boAmUDgX;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81F4606A329
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 18:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B81F4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=boAmUDgX
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-84a248254f4so751521a34.0
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 11:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780964; x=1793385764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=boAmUDgXp1hX3kYPRavRSDi/Dfdi4D7sJxbXiSJRV98P+/YkSgSgqCBpcS0U6Padpi
         SvIh4brqcif1qCnWZBtg07XkoDdwxPzxbBkUVU3kuG25SjJHJuJS9U5zRa4YfgMxvy3p
         NGdxuGXPhT679NodQEH7OlBovG7Zf/eaFaEYT161Tc/DVC3/VfRYH+a+kom9PTnL8jhR
         ik0k9sDWd7F8uten/xEGvLIpnM/JBq3TUVcMOc5T4WxRHwemMnVMAPOiHRgyAOxPlwZW
         JX6zrseRPIxDusVPtZsNREFYpz9+1jCtm56ROoYIJ5AkCh05eHH7R8ht6Rj2ED6tN28A
         RKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780964; x=1793385764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=pf/EbOQxBmEAOcqoJnmNddil7jajBHq/21JNy2ckoH3nnLy/CLFuGq0aPkZcCGweal
         o5dfIiIx70VjeoMUlVnBvKfAZoQsBsvqukvo5g4m+qJaumpjhK/YSfTfQLU+KHn6BTri
         ixfwIhjgyoDebJf7SZ/xL+XO12dI8fjWvOY7j8wKzdEF67fRi1B2Am+ArzE6bWVuCbK/
         a2EJ0GhGMBqC5JHRV4ZEpFfi8w3Uh+x6oH16Uj3cPd9Jneo3l6Z/TjH4GueYYdrtcnQx
         pVpnpwb/N4Dqu8vncWkzkV0XM2vMWdOAp327p557zkiiZG1ekqUQb1IlaeXVRREAbp3Q
         89JA==
X-Forwarded-Encrypted: i=1; AKwUvBw508bj5wix+iU/ufocwLnS4KL667B9o1ynsNRNkdah3q3RpZI3jecSi4qj1VxVPFXR9MQuUcloBVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF5JtLfskEUHyCIl291hDixNImbq/XF1BCSvSrDwc7JcoNBfBf
	XFbYtGQtlSTZp6NOXVJnC0xB1USQTJDwWvsZ70JKSdahCzs2OOQrieO3
X-Gm-Gg: AYBFou2oWtjSB1YNJ1ZG6yPdgOt+MD9nFmC+OCAvuVcK8WKM8gzBkWida0LMidA4NRR
	TDvUtAcsWHOd4k5OGw/kCkFZhUlvBtU1UWUF7M6Zi2YijFqZ9ZNwTPTv7oEBlSUgRNzvYmxYEEW
	RKlg3mMZFmMSLh8UQPLMmVqm2V5Bggdm/l5k/vtl7fJekesLe7IpHIaVIYHeIo+bfjtYv5XSQtP
	ivAdy+zWlNmsqDCqn7EAvycloub+q6P/NY6raklwKosB2XcZ63VDo7Nj968IMxJa/x7hnWAItis
	dQDYraxtRLMsnO8ZqGirrmTBjkacFK3FfyJZjCplR0ypD67xbkqB8HE8wmmqaQwWVQa3q0eWA2q
	XEl7iXLs6RV4Bfg2vtrDaagmzosFeQFSEkZNd//kgOP7X2TyZ5g3bxWWMtFFD8MPIb8lfBpBm9m
	5fbU9dUGlJyY1JoHgEQnoxNgjyUtJnesjrRw4hHDz+sfnsH/qTOVxzX71INLodojg+V2lmQlqVt
	QW8SRdFkBCWl6Vv3pAUAIoRXrkHgBjdRuyqcL+inHm7NTGtIM5BejFeWeoY1HDSgwJSZwX2KrGj
	0lQBRhLuMNrR9fVA4uTo/qU402kih7n5f6dl47zXXBegXD2lTwb2FgTdMBx7IiytnumMj4Oz4Fa
	uWyw0kYtNMk+r+0N7BJgWnwVhSOQZkXLvMtU3kEH07/OLqFDER+iRrjs/rq4sc+uv5CoG6HyySu
	Btiw==
X-Received: by 2002:a05:6808:30a3:b0:4cb:818f:d56e with SMTP id 5614622812f47-55c0020ff8amr68675b6e.22.1792780963715;
        Fri, 23 Oct 2026 11:42:43 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:35 -0600
Subject: [PATCH v2 1/6] dmaengine: sun6i: fix physical channel index in
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-1-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
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

