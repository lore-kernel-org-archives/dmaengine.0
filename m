Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777453;
	b=g3kKMn6hZq8KNbKErhGX+ItvaX1kgEBoRXe0vsuZyHVksEKuU16sUEN+QNogNkbIqzhj
	 91pK66092JJFS17AOZDKhAGf4J9DQJ956B90Q8Car2O/DE0h+Q9vGHhu7Q2nA8T7wuUNL
	 RBe+uqtY6S5wqXFr54N/jPwCfxZi7e1+OZEYLa47eD4024jmtpg1nU/7ILM6z9WYhpjJt
	 ZQubbO5x3hE/RMr8OxcpRrOK6dyGRbkmL+nhD+y8c1QNc0n61eeClvLDE90+4I902w2xk
	 0XqlqJgOMK9WeYYfp8JL4HzJXGkWODbIIH8RUS1shWDX7KPLVgGwFlm94f1KCEyxlXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777453;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=IO9xwt4cKXKK8PZpu5RfFUHHrgFNwh2k+PlRrCKtaq0=;
	b=QWQbrGul4DxSU5glJmAdbnz7n+nWOUaJR1QcaOiD0XdSr+k/RVtFa1kBGf+hI46t1zch
	 bJm7+cnKV4c6oeo2THFw8picFGJGyvXtqtgmyJNaVc00UqteMNySYkqFMq/bnxN3Q7WV4
	 Ajv1HRe/T4KqUxES0wTONK0DAyygKB4UUBIB0Ek8IVYLASROPpKiTJamkIVlp8SYeZFFT
	 TzeeLItPrGnsv1HbiHUtgrPuFVpE/A6tiCIPD/+ETniSmxaN7jjFejfeSZGvpKcov5Smx
	 UBj1jG80CtQJEgbWeSxXY5hKW3tZGy1celoBxPaUT0J2iVTwJ/Th+sThEEyzvo6OY5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=B4mSTYpt;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8491A606A33A;
	Fri, 27 Nov 2026 11:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8491A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=B4mSTYpt
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5641a2c35;
	Fri, 27 Nov 2026 19:04:01 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	Frank.li@oss.nxp.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	manabian@gmail.com,
	robh@kernel.org,
	saravanak@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] dmaengine: lpc: Manage DMA router registration
Date: Fri, 27 Nov 2026 19:03:57 +0800
Message-Id: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-HM-Tid: 0aa21cad2f1303a2kunm13da2c70394a7a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSh8YVkIYQ0MdSx9NTEkaH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=B4mSTYpthwGrLD3af3rf/pB/JHs9Nh8ilk/dAtdYdGA7Ua74Fvs49Ier4Tad4VUjoyYir1UyY9/L3tzEbUn8IY0B+MIR+UTV4sNsd9+r1zqtg5rfWODqXNjgDr3WCWw64xvaJwxYlKus16hqtEtlqgdnQhuYp3ab2d9E81jJ5gQ=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=IO9xwt4cKXKK8PZpu5RfFUHHrgFNwh2k+PlRrCKtaq0=;
	h=date:mime-version:subject:message-id:from;

Add a managed OF DMA router registration helper and use it in the
LPC18xx and LPC32xx DMA mux drivers.

Changes in v2:
  - Add devm_of_dma_router_register(), as requested by Frank Li.
  - Use the helper in both drivers instead of adding remove callbacks.

Tian Xuechen (3):
  dmaengine: of: Add managed DMA router registration
  dmaengine: lpc18xx-dmamux: Use managed DMA router registration
  dmaengine: lpc32xx-dmamux: Use managed DMA router registration

 drivers/dma/lpc18xx-dmamux.c |  5 +++--
 drivers/dma/lpc32xx-dmamux.c |  5 +++--
 include/linux/of_dma.h       | 24 ++++++++++++++++++++++++
 3 files changed, 30 insertions(+), 4 deletions(-)


base-commit: 2e02fb103be058cf8b2fb24112a74a2715e090f0
-- 
2.43.0

