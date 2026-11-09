Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200438;
	b=zaPl5WaMpyb0GjcSihJSEVnR3iNkxsTk9raZZuSrjK2dubwNYR3wOuZRBscXIHDgIDiw
	 yUlB0BHZEzrCBaFIsjAsrH+n3nzCUVnmG4O2PQtDPZIdxTvrhamzkX5f2SRW71MUxyvEH
	 Zsu0DHpEkhuzxSZlA5iixAODc28oV08o6VhTy6dRX5+EYTl5NKd8sWRp6zflcxPwyVHD4
	 VcrwH0GofXRUPkX9jrmoaQ3BIL6ve7j1pPGUtI+7AAjHIyL+aFGmHst3MH3pem3DL1jMP
	 xokvBgYy+XuTU8u1gikmELc3m3TWZCEZSNwjD/KBijila1jk8A8ctkqhGrkvgPOj3/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=oESDww53zGSoGH4IO1bUrrqGEhAQT6H46eRyViPIMYQ=;
	b=VSeJAvmJxJEH1ao07zYXt/en8tZJf44hmxZoFYAWjP16gUfFR1yU7pBILt0D2DgkhJgY
	 +tNRcNwKp5j3o/MEl/b8W+B+NvALFR4b+MV5yGQwf8Gpubp3p4OLwNDn6eRUipZK0FfJs
	 HcsLkhpSwn+ZFJ05rLGeUVbHYXJlSHp5PsEf123Mw854CmnjZ704SCPd1yiJpbQ4kgT4G
	 0bSjiixfbi8x3Qmy7CQL40u1U0bvYQfnrE0KL5oRDHbPZSSUnVfStjgJmKkPAfcDlSNqM
	 WUqoB3f6ISoKrfYPC+0rs1xOtH7pIDWMbviAXy1aD9857+/aBF0Pgc9C4glPwlwyfVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwNoimSt;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7751606A326
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 05:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7751606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwNoimSt
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8256106635eso182830a34.0
        for <dmaengine@vger.kernel.org>; Sun, 08 Nov 2026 21:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794200436; x=1794805236; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oESDww53zGSoGH4IO1bUrrqGEhAQT6H46eRyViPIMYQ=;
        b=UwNoimStSSPQTdJ+XmanVE386Z3IgzT3eWxbLpFXXMkNjf/noTv8mxVn7eyG3MYHAz
         bNTT0kEnP6BvRx4sao4ayQdh7/I/3dMVoLK33SNaPiF5n049eeiw+jDEmWU/C/ixw0zf
         bN/1GckfHsze3jyUtV+I/NrY0qcwBqZ+xGorxjWeJfIMXS+mgJVJNPXjlo810Y8Ipaas
         FLalFKze3VMLEMvltQ91D2thIlkLoMhIG/+rUYOTpQL8/j2vE3BiupnSa0aNn+e8eEcL
         qv/1lpNVoICG5mAElMpPmO/eMKVyRzYLuZ5zXxUaKSbJIxrVO/MQhiiS/MaTAY/vD/s1
         S91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794200436; x=1794805236;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oESDww53zGSoGH4IO1bUrrqGEhAQT6H46eRyViPIMYQ=;
        b=EYeUJL+MJ2SHav3mZA5B+jEWRM1+5ju4k9uGQR+T1tv14ORORXPp2HpI+660LDp2Bt
         y4dckD2la8cQ9gRWcQ5L76jO5HU+pOHttnr0dAYdOmKlqOfdj1iqUoSfX3LT/L0PRvq/
         qKUKp7xmzCAVOh4ZnTaNYPR6q/spANOZVEMSf2FYcCpKHBqqMcxnteQT3mAhjFK11dlv
         OVFU4HnRwQTEb6/ynS1cz1F9zlAKrq3WrB5Zq0WrNzwNj1cePzOby8Jpf59Y00LZW9rJ
         q6fCJ6lRagHLUB+eqaECTbd/xKnrdftnW/kNiV3J2xhuT4ErzOJTcEIQIRXFIntz9+JR
         oFdw==
X-Forwarded-Encrypted: i=1; AL+hErFnkYgG2UthmgBGT8xofxp1xEHz3RyHWmgR6GqNY59crDnKFw6tn3TMdk6bC2QCwPlrRCQIr/0WJD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h4TGUBCg1M+luerrrvyQi4rW8BD0PpzjAIjfBFvmvS8pCwT7Y
	DPpxdsmbiaD6jBkxgrqAoMyXlF4qzr+UEbee84hvuCA3j16pyRgjrskxSFaf65FT
X-Gm-Gg: AYBFou0TcOU+meGVPEgI0H5M5us543Udfnr5csCFHR/avAkjyHwDp3jhVG/ywyukxBK
	iF/VxhDHfbQYHsAHyF45QGuOQzR73WRf0trgdy/CUhCm+cay3a4KxGIl6F6kR7WoNiNuZE6U0aF
	gKVtoSbsZ8JaIgMSPd5qNaBh+f6r1sMC1bHWAsuHYLLBBGCmfPjABcQGYtaEYgEPs2qZPJgqFcO
	Q9zUV34XDRV2uMRoh6oK68PcEo+NdV3i5irlvN6GSwqcQ7WQGnczhCBbuiydueKkOXeacbluPj8
	4yDsFs8o80HkfdTxVLNO7dEnlNPkgOUQ4U8Xlx2FrhvuprkctB9TghhhUfkdUgqfKLUJIdUxMDA
	/d0AiyQzS2PUsJQXPoQHreRU0XhaVcMYUK3rGa5UjgxYHMyw2tCUWMXTMxfoHYd4UgP7wLfvg8m
	zbFdfh28GwN5N7MhOLBGtcsF7s61Pz0d7JO2aVQg2CWM1jl01Bdlc2irtQdgxQgDcn86RglDjRK
	2xoMe+K+giQwK1Q1OSok1anajGKh8Ix5keIov0idMSmdNHLhwOGvlnjLZvU8/MPdATv/ntLpLPE
	F5E1OH4ba8Emw2P0k1ehmKIPaRLe4TZ8a6yhz/LfF1TUvJf5xXZbvjFhpjxmuI1cC3NWhRaORlx
	o3LxbhWlEBhUZEWaZI+EWjTiWKBCkgyxbkSJAB6FpnciqXAJS2FPu6GQrlUV878U57//m69kBTl
	HVNOFJBazok5JPDEzj0no3j6uP2Zpz6HKpng4VYPWwPAHDu67kDMk=
X-Received: by 2002:a05:6830:b13:b0:81c:dbd7:65dc with SMTP id 46e09a7af769-85f50783fccmr2360049a34.7.1794200436306;
        Sun, 08 Nov 2026 21:00:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fb2be33sm2953090a34.13.2026.11.08.21.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:00:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 22:00:32 -0700
Subject: [PATCH] dmaengine: tegra: only advertise supported pause
 operations
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
Message-Id: <20261108-submit-tegra186-dma-pause-caps-v1-v1-1-9cc9b17a033d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQ7CIBBEf6Xh7EZAJY2/YjwssNI1KRKgjUnTf
 xfs8U1m3myiUGYq4j5sItPKhT+xgToNwk0YAwH7xkJLbZSSI5TFzlyhUsioRgN+Rki4FAKHqcC
 qwJirVxct/U1q0Twp04u//4/H8+AmeZOrXdwbFtvcZoxu6lFTUgwc6Xzs9v0Hy5/Ip6cAAAA=
X-Change-ID: 20261108-submit-tegra186-dma-pause-caps-v1-664d1320d502
To: Laxman Dewangan <ldewangan@nvidia.com>, 
 Jon Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Pavan Kunapuli <pkunapuli@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: Rajesh Gumasta <rgumasta@nvidia.com>, 
 Thierry Reding <treding@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>, 
 dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Tegra186 does not support pausing a channel, but the driver installs
device_pause and device_resume for every variant. Both callbacks return
-ENOSYS on Tegra186.

dma_get_slave_caps() derives cmd_pause and cmd_resume from the presence
of these callbacks. Clients such as generic 8250 therefore accept RX DMA
channels that cannot satisfy their pause requirement. A receive timeout
then reaches an unsupported pause operation instead of being excluded
when the channel capabilities are checked.

Only install the pause and resume callbacks when the matched chip data
advertises hardware support. Keep them available on Tegra194 and later.

Fixes: ee17028009d4 ("dmaengine: tegra: Add tegra gpcdma driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/tegra186-gpc-dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index e76c58f213d8..72266f490e8a 100644
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -1518,8 +1518,10 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	tdma->dma_dev.device_terminate_all = tegra_dma_terminate_all;
 	tdma->dma_dev.device_tx_status = tegra_dma_tx_status;
 	tdma->dma_dev.device_issue_pending = tegra_dma_issue_pending;
-	tdma->dma_dev.device_pause = tegra_dma_device_pause;
-	tdma->dma_dev.device_resume = tegra_dma_device_resume;
+	if (cdata->hw_support_pause) {
+		tdma->dma_dev.device_pause = tegra_dma_device_pause;
+		tdma->dma_dev.device_resume = tegra_dma_device_resume;
+	}
 	tdma->dma_dev.device_synchronize = tegra_dma_chan_synchronize;
 	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-submit-tegra186-dma-pause-caps-v1-664d1320d502

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

