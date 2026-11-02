Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616284;
	b=ZKreznO1sl5qvMnsoOUoZw40wIp6CJzTgp+EF3pIIOVUu8jrQvdpd+4I6JQvPB7a2Nho
	 OKaUnofjxvdMVbcqs4XfhS2M7cwfidJoA5QkAgWAUWnacqwBJAvOPV8pCY/6D7J1EAF09
	 jfa2axkawp07OPTW818OzuA6walCUVz1WvPwnU4LJQQpHaNVjZHGb4e1jAE2nFfq4fmyu
	 XbJa5gZ8GnWNmlqguQWLtuo6kpc1E/QmmEfCHxkfquv9RuoI5XBlDnIMcldsEQVtWsh0j
	 UkzLiYCI4DVvXkkvJcFqDUzp8Qc1uggyXz/axKoqL6O+Q+6E7SRpSFs196E8K7xCdcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616284;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FRMAH9xsWV5OlOwKt/muUsEdbHuRpkZwA/qPIkRJwC8=;
	b=P15SY3OSX2kje5nBFVmAKHiHy6ANO1JAClm+tBWHSZ10bDTNCJThUAI3NHo27HpGQZtM
	 7xQdKK8CiYnRGJ6xOC3ZuwBhTUdz5JZhruxRhawv7FSIKY9nB9d2FKyNfKyiAUIWyQIMa
	 +mHM6qTrbwe64JujqoT0LAhfhU8BcXndqCG6IJnFiiZO63Nj5bnhpdqqasKEg04WTd2KI
	 MSHtZjG8t56q/JCQTUbW/wiu4Vj4tx0ALQmxV2nqqK0dI0HiVufpPlLbdRKRiR9ecQmeR
	 y57u5uZT1kHHEjaNOPnh5e877VN7aJiU/1j2hin4+KloDi3DSUUn0vpBM1orlK61/fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jWwBqHBc;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4714B606A324;
	Mon,  2 Nov 2026 10:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4714B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jWwBqHBc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jWwBqHBcWGoeIMnDaJxOkkJz/zmNOZx7ITAyoUr4k4T5cSrXgo3wixkakkLUNCn9+q7GF3tiV+Eup
	 40tz4ZzORprqsxt/VoWgEe6KniQXEFD4op8JuowSjK8BuwpfzgKvfS69bu9Wcb3TozF3sjxpekftkN
	 HjU+r8eGKO7DUlJg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86ae86993a94-2963d;
	Mon, 02 Nov 2026 18:44:35 +0800 (CST)
X-RM-TRANSID:2ee86ae86993a94-2963d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36ae86991518-cbf5d;
	Mon, 02 Nov 2026 18:44:35 +0800 (CST)
X-RM-TRANSID:2ee36ae86991518-cbf5d
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
Subject: [PATCH] dmaengine: stm32-mdma: Fix runtime PM reference leak in pm_suspend
Date: Mon,  2 Nov 2026 18:44:31 +0800
Message-ID: <20261102104432.873-1-laixiangwu@cmss.chinamobile.com>
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

stm32_mdma_pm_suspend() increments the runtime PM usage counter with
pm_runtime_resume_and_get(), but when a channel is still enabled it
returns -EBUSY directly without dropping the reference.  The matching
pm_runtime_put_sync() only runs on the success path.

Each failed suspend attempt therefore leaks one runtime PM reference,
so the device can never runtime suspend afterwards.  Drop the
reference before returning -EBUSY.

Fixes: 7cb819c856d9 ("dmaengine: stm32-mdma: add suspend/resume power management support")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/dma/stm32/stm32-mdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/stm32/stm32-mdma.c b/drivers/dma/stm32/stm32-mdma.c
index e3bbdc9ee..fe1ff4a00 100644
--- a/drivers/dma/stm32/stm32-mdma.c
+++ b/drivers/dma/stm32/stm32-mdma.c
@@ -1785,6 +1785,7 @@ static int stm32_mdma_pm_suspend(struct device *dev)
 		ccr = stm32_mdma_read(dmadev, STM32_MDMA_CCR(id));
 		if (ccr & STM32_MDMA_CCR_EN) {
 			dev_warn(dev, "Suspend is prevented by Chan %i\n", id);
+			pm_runtime_put_sync(dev);
 			return -EBUSY;
 		}
 	}



