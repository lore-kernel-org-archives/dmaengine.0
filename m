Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735196;
	b=mu8mW5UtJidSTMdUhLdHZzZwIvKQ1EHBdhhcmFdP6OrUNAv/drK3MAKcjY/MugeGVZ4Q
	 Mrlnkeo6OcLtJrb0pg4KtAPDbp4MNVZuslskOo6ewMvi23NvdJyhJ51DngxrdvuWS+I1E
	 qbhBzBTXZU2BjvwknoQ4XQDO013jwaByVrxdJG+D1a02aE7p39wwyzVchToTXQeHG7vZr
	 9+Zx/6/OWVhzk7x1X8m2jvXkTs7sSDwQNKV5RsbJe+BM6zqp1op8YVmHWuOedrjR/R2AR
	 VOnWWZ7ns7cRVk/KMvMDA4V+A5P7lBkYp8S3lX6/zJD/4oKd0YPPIUTBS2iXMHSghiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=w8G8ifHYAKfhALD5ae+dZe67OgXfj22iPEwtf7Dbt0k=;
	b=ix3jve42chhOkUoN7+DHuApGp2fB4PjSxBwR8YslnwolanDX91HPhYV01rW/GPCNTpW8
	 MR3T7i0PKN7r0+0Dmnzt8ALQ6OCnss+q9ayF2+YcXbXSjXUfn4EJQw/G39I6ArzP7QPFg
	 0+WeBnPwYfVqCSgFDo2DK1/Ped+xjmsz6Zx/AJlQ0iMPXTsYXUubtLv+CBquuEIISBiub
	 lfzjay5AO66T174FX5uqULyUl+7eKW6F4pKEMLpftFtQC1y8CdEXRTKQrxverKTyvHYyq
	 loh8avtaMX4jiJoTKFH2aAiX4EpzS2vwx/2elOwmIK0tE/dAmgfeSVE1YuuZbv2PAyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dLQfn8SE;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D02606A33E
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 09:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D02606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dLQfn8SE
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-70b875f6f1fso2980222eaf.2
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 01:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735195; x=1795339995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8G8ifHYAKfhALD5ae+dZe67OgXfj22iPEwtf7Dbt0k=;
        b=dLQfn8SENWQdwhM+3gZFbvRn/ZEgQYuRLM3YfMEKnqn0VRTM4jtSpbKJxmMGbMD1jh
         Rq8fOsIb5OxLScPlINGeWLcelmVraq8Ny0mON1YOEhVXfmlU+SlXYbH5w1hkFYe/j8Oa
         rjt1Amg9sXXqe8YuabcTmXgJBKnvHzWgIHqyZ54HohEkD15vDvbkgQyVNzZjmbFh3LNe
         vB3Mt0QL0SWGcD7I9o1mzuvjNPtsVFTM1a4EsaPvDwntJAopJlTKHsBLjPcmjH1hdFgJ
         MPf3fFcNpUuYhAw1d4axKklQn7q8rWsBAS4Ilbjf639v18qY7EVz678eFrLHmjZWm2lz
         w3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735195; x=1795339995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8G8ifHYAKfhALD5ae+dZe67OgXfj22iPEwtf7Dbt0k=;
        b=Qe1gg3L91+zlsy0gWY50k0H3uyFlb3IVHnlQ6YcYGAWxJsoOZTZ1Hh/RL6ERLcNZr0
         s/WPkfsogSdS0OTNew31sdS817M0lEo/4u2OheDX5GpXl2N2v5L6k8ucQlRDdzdyEAfm
         mCp73lhYFWq5QNbi9Sgroic4MIhHxI5+FGyKRdqW0W0+I+X1FyQpka5Nuir2fXOCOjeW
         l96oeBHoK/8YBwRF6S81NI+SSuK+UJ03vydRV+nv8E5a0OSDSL5uEWVbquQ3MEt2h56S
         krzaww/QPefLvaBykSj5HHNbP/gh5heHcTbXczv2OR5o9uzx2LbP3xbBgsrynVZtJ9vr
         StFA==
X-Forwarded-Encrypted: i=1; AL+hErHt7H5q5DYJHdqdNrBvMc8+ecZS7jAnWZl5PtaKPLjPLWvzp5YAQppBbR3GKEaLYUjJk/9/4AG3z9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8O+Am4dpA7zyknyT+0fpKaZcsCZkN1xO5sUmVt7hZtPWksOWEI
	Qz7S6IVVncRxMdN5QyaP8RO1+4VcB8kMstSPRl4l6tiNCwU7cJlWrYUN
X-Gm-Gg: AYBFou1114JjIFCIaS1Vw+iJW1kKdt+E+OGs+HJGHtfvUsCPPJsosq+BPtT8BE+5XAl
	mVUcAIxCEDkjYUQ4n8F6BfIzcizqkItZmbSGIybXzQfal1S24cB4Lz1GNVy4YXId9gCx3PsympC
	YNACVmTh6J286eWwDHIMurTS2w+z29l/t9NIGGFUuU6ut8d5jeA48Vf/tGybWlsKAbbXqYO/Czy
	nnuAN+hClX/DUJCZZLVBtdl3CklTMTeney+1/DQJwYq7cNPa1LGamQJHS/OdJRdijGCO0Yv1NZU
	UWAfqgY+Y/TKnP15sAW6u1yx4QubEXVGLbUYov0no+vzlc03haWdp3UcJLQsaZtUudqgslhThyC
	CGAHh+hl5DmATHZmKxuQAJe4V5rPwpjDullPxFJRp8gsu4Cv6w/hXw0kGGmhOWXr86+tE57w3sn
	ELiQuwqOSJmIq7HiMewmi54lLvUEWfj7Hq7YnLesxE6k/J6LPtSfbbYqk1rejycQ5g1jEMdER06
	j6Nu77h2E6jygOHZqgVU2azd+XXJ5wsQvIYMNpLiGrw1A/sUPeuFokYrq37iP5Kn0WUA9+QGwca
	dnnbMlepJ/ON8pvJeiBFTzbVSasRTl7HgsRpoqIUbBOovqCwNaiWBwZN6Br4MB3tVEE5sCoJ+ib
	RUE1WGaOCbPBTzFEQl2SNO+8LDcH5CU5qqHFVUST0kunbJO8VSFs+/bTa5RBhk3hFYORQCwqxWm
	tDNYqvmFb81VrDGIlCbeNiaIKUKp+q8gjPKzGWB4mdjC5tzHYCFok=
X-Received: by 2002:a05:6820:4a8e:b0:71a:ecfc:4434 with SMTP id 006d021491bc7-71aecfc5888mr297943eaf.61.1794735195084;
        Sun, 15 Nov 2026 01:33:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:50 -0700
Subject: [PATCH v4 2/9] dmaengine: sun6i: handle the last partial interrupt
 bank
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-2-043cd476a45f@gmail.com>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

The number of physical channels need not be a multiple of the number
covered by an interrupt-status register. H3 has twelve channels and
eight channels per bank. Rounding down the number of banks leaves its
channels 8 through 11 without completion handling.

Round up the number of banks to visit, and stop processing the last bank
at num_pchans so unused status bits cannot index past the physical-channel
array. Use the controller's configured bank size for both limits and
the physical-channel index.

Fixes: f008db8c00c1 ("dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/sun6i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 885cb237b2b9..9533f3bdb949 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -589,12 +589,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 {
 	struct sun6i_dma_dev *sdev = dev_id;
+	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -604,8 +605,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
+		for (j = 0; status && j < channels_per_reg &&
+		     i * channels_per_reg + j < sdev->num_pchans; j++) {
+			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0

