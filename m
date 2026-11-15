Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735195;
	b=RuEJpbMvi7hgQkIyySl7IQkNO3EpB2u2w20N7zbzQ5cDRGZEHjbAFYitsKtwRjokhXcA
	 D9LgM1PD46phEumkFY6ZLpqThNTaNFj24SFKqW1kqGWF7tzYAc27PnCOctmpK+gDdmucj
	 ZaeW4yzIQlvNvEeIOBZx5Cquf62zU3E2gr/bRBiHUYG0N3EHStTjw6vzmGdRzLgwcpFio
	 6y3cRIT9Je/YuwwMOJ573w9TZ/GvOfM4ezZXxkz0fir5KRT7pXutGyllm0T7J6s81hC2Q
	 4c1nWfnFz5MdLzV1enmFqmcWTyWm8Gwqyrc5PCmoxb8SSySuyzhReOO0hwRlRbJ+fNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=R2O9ixsjiKLUJuRb29OcTSyZsQI1rKD89T0Os+kzNHA=;
	b=OtZM8NsvS5rOljrHJ4kAIMCSXtmaivrZvaJ6zSxLmI88+GtcFtdoTPhh/NsAZp9xV/hs
	 f7YoGIMaOuLaHtjadQNg6X8H1507bnpJy+fJvBvYfH8Cben1+i1LRIbettzYh3lkToQRR
	 aiLHhIXzVvwn7Bj93ktEGY3jrHNqPR0jByFbNvs3gSdQ2JJS9KYSyFDOa1MWg0J/3ZcP0
	 zAwC6wMLc2mDqRXVPAaZX8lYf0MK+o9EEkW17H1R1fT1bihGxfTxz4Fn6PHJ/JHMazeJk
	 AEqnkhyZX0suF8YEyhAnDIOvrEcU+GB975+GuuhjOP4q5E4TIbTUoGvFSI+brGgHvAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fs/rvhwe";
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6098606A336
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 09:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6098606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fs/rvhwe
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-70bf1671c21so2425978eaf.1
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 01:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735194; x=1795339994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2O9ixsjiKLUJuRb29OcTSyZsQI1rKD89T0Os+kzNHA=;
        b=fs/rvhwefb3mMzLgtgmDlbzn+euuyqPVkCufyk0vazIKUe0xa7dm7d0OBBKCkgEdxD
         6kBuunuY6gtr/uoLEhtVHv3YQUOutY2hGXGAnR0A2WER43Zx55GOK5iCBeA/oUe+qHjA
         SL62uIko58yfVm5nfUXYhKkeeXv/PK/tbgbqPQQQxVTcoab2WTDU1mDzwMXjqk/atNTT
         estj09AaSWkb7Kz7KxATe0p2h/+pP89t6mzSPfG0H924LT1IEAD05pOKk2c02LynK+m8
         Cu8JFSZYqg2O2pO88MMlkbbUALW1jG/q6Y7EBBIR8Gv9UVhQFj0P2cWFOoACw4U8c6KR
         SmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735194; x=1795339994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R2O9ixsjiKLUJuRb29OcTSyZsQI1rKD89T0Os+kzNHA=;
        b=L+UTjQcJVVfQtEnNP5QSNOIuSoeBtKN+hBhKVsGglV9c2FC9bkA/lLEI+Fy1P2WuxK
         TPoQu6xQennzALsngBWnAWD5G+7NR314kwM25vjZmZQJrKwrIIWSVlvcYLXVeu/PWM2p
         bdteNsM1GMqcZVYzJOyW24QoQXwSJTXWJYBiGiEwdhXiYUEKWrAULbIoEaK+CutXxvNp
         rkZ4XLuI3dzZExn08jWNL759yfbuXleiSFqpiKJyGIjR+mKB53h/R9VZ7HPM3Jtr7FrY
         T0bGlNhZ5CiHhvaBGQW87zVeDx0n68pDPUs0SqM1OCL7JzZ/QECmLVx7QlE9WTip53Mz
         4xfQ==
X-Forwarded-Encrypted: i=1; AL+hErESiNAvm61stc3u0ik57WQ+Un4KAnNTm3OdI2fasuXE5Z5OpOytjiiGPj3FDo946SjLGhNUU9+1Y7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WmNIN+z3Ep+Pm+TN2KRsTfZ14mCBod4LU5iGwOCQbGHbcKR1W
	6cNbajgWXJ1Ml+n3l1h5T219vf/FM/qPEmdwM3KyVoKuMoARGzF0jPP+
X-Gm-Gg: AYBFou26jSpNpp/DHD39ZzTYB532IDaag47DJ895lxp6BFLgQpbJ6XXCXNw/W2tRGN5
	D9y6tIC/2HWsqAQoox7jN63DHTRtcimtMETUCqFLNnKDwIOajy1+awDM/NKWx9LkBPVCdFnWL0Q
	wDpAYBPF6f7e6UgD1kKazdLDTlBIjO5Hh5Wrp+kUzxUwVusI+W+Fd7cjQFRjU9VP6CFq1GBh/tU
	ZMNJZDH2cL2s1Sub49QWHVarTCcgtyen64feNiUUYsXuuYC0l5drFrF46vEkwm+3Jv0b8eksjZE
	k7dbZUXuJ/0iKDktxrP1mjXFFlkr6vroJkE4LQrFA/k7veNEnmcKpDVUNrbaHvTQjyAdjKKCyyj
	CB8M9C4MNhK7u3kXC4dSHfWxR1T49tg7p55N3XorZs0edvwLMboA4iDqCLCNx/OgCDsX2Q+eY3D
	fwNAIZlZIeAhgaXwlbEABNI/vtPzLqKngyiG4iVCRDS8LAJ4NcFG3Xv5RX0Wmc22Ofw09oZSUYS
	ylpiZX7Nrc77C7QfQwJMoA6RuKBv29UPmVkl7iTY/3RtuKM5GDi93zc4roMgJbALqiU0iuyY94b
	KqM9UbEVNhf+F+auWbBYOR69T7UOv21GSWEI76a8FcuLcWTCtOk1UHRKUzBRCJ6zQV6x5uhhzXu
	uEFeq6eZgsnDGWtF//YVZ7hF0he9G7DpGJyso9d7ScwhRu3zBL0gOrm6YqxS/v+6VZHzQIASjqE
	iZ093FoMHWtUw7ucapu30HQAHVaTCyegxCpqwG80hdjqgjXXgwJ94=
X-Received: by 2002:a05:6820:c3d8:b0:717:da:ba3f with SMTP id 006d021491bc7-71ab4fa7032mr3576066eaf.18.1794735193626;
        Sun, 15 Nov 2026 01:33:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:49 -0700
Subject: [PATCH v4 1/9] dmaengine: sun6i: fix physical channel index in
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-1-043cd476a45f@gmail.com>
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
index a57f530c6f70..885cb237b2b9 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -605,7 +605,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		sun6i_write_irq_stat(sdev, i, status);
 
 		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + j;
+			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0

