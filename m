Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616076;
	b=CXesDZBKV6QaYT0eChyNokVh7AjOlW/mNGpiAMQDJKvWDCyISuQeNrqqzyWnKrGieMpF
	 Iyj+leFWue3cUbm4ZPoYRbKQaPjSGuH3T7LWQnPCiAbuvJZ19JQuHHYH/WTjzO0/hee/v
	 ol9wtSPXEAkKDjw66tndOgcr7LNL5UKdtyUom2F0BuEfaU1QMb2tcFhhozpnnI3CfLxmI
	 SFI7ydCkijhniITJBpvWEcviCdSsWGFFtL34m5rYwpd22q+FECk+WuSE5paoFs35WuZDL
	 xG8z78gi7wDYoA4ARYVd8F9YR81o3FdUjnFUFsaLQ27tHAHmtrSu/3rStfxvjDr5gHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616076;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4aaIDhtCEIv+g4XbgCs2JJwVMBanpKEyQuZrw5hylKk=;
	b=z9YvJloqGBipIhbbibIScEhL38o0WhfX/6NVN8eGtiTnhXHIZFXaNEkjdxOnP3WNSGxY
	 DXdZhZM3UYB+lfNP9sJBghzuZkk/6SCWxptkosKYNHO5BYiKqe3r/HRXcwdnicnUijAyu
	 B4a75oxyq7D/rrTFMW3bYpPush5KCPMt5SSFoFWQIX2cKhRq7IUr1/0s48HZ2DqtcPG0R
	 GUCTttlJaCIr4pZtMF2p86iewIb+zDNAlEyu4GdDHlXGn0dekjPDdbVnU/0cfe9wI+68s
	 qC0Sbh+0pmkO8REFe1HI2wlQLLdNmoAusrOp4w+YMLocToTchQDuSrNhPSawwJdG4lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=WE7aUxtW;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF43A606A324;
	Mon,  2 Nov 2026 10:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF43A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=WE7aUxtW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=WE7aUxtWY6vl8lo9CB+GVp5wcPZ/b03EbJdEMPcLBAiqU1parnJPG0fuOE46k0+f4y2azOlzbIhq8
	 cHJRa1sBpAtPC0D1vGo2o8JWyTsk2BeJJxi2yUhXpcmK+xKU0S60VFpk9U1hdMBn4wF0FfT4YdVM/V
	 4a1Pdv3O4dVbF+9U=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96ae868c622a-8f02e;
	Mon, 02 Nov 2026 18:41:11 +0800 (CST)
X-RM-TRANSID:2ee96ae868c622a-8f02e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76ae868c5a87-cf5da;
	Mon, 02 Nov 2026 18:41:11 +0800 (CST)
X-RM-TRANSID:2ee76ae868c5a87-cf5da
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: =?UTF-8?q?Am=C3=A9lie=20Delaunay?= <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] dmaengine: stm32-dma: Fix runtime PM reference leak in pm_suspend
Date: Mon,  2 Nov 2026 18:41:07 +0800
Message-ID: <20261102104108.794-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stm32_dma_pm_suspend() increments the runtime PM usage counter with
pm_runtime_resume_and_get(), but when a channel is still enabled it
returns -EBUSY directly without dropping the reference.  The matching
pm_runtime_put_sync() only runs on the success path.

Each failed suspend attempt therefore leaks one runtime PM reference,
so the device can never runtime suspend afterwards.  Drop the
reference before returning -EBUSY.

Fixes: 05f8740a0e6f ("dmaengine: stm32-dma: add suspend/resume power management support")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/dma/stm32/stm32-dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/stm32/stm32-dma.c b/drivers/dma/stm32/stm32-dma.c
index d3ad78562..2abe846a9 100644
--- a/drivers/dma/stm32/stm32-dma.c
+++ b/drivers/dma/stm32/stm32-dma.c
@@ -1743,6 +1743,7 @@ static int stm32_dma_pm_suspend(struct device *dev)
 		scr = stm32_dma_read(dmadev, STM32_DMA_SCR(id));
 		if (scr & STM32_DMA_SCR_EN) {
 			dev_warn(dev, "Suspend is prevented by Chan %i\n", id);
+			pm_runtime_put_sync(dev);
 			return -EBUSY;
 		}
 	}


