Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88841388881;
	Mon, 12 Oct 2026 03:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791774513; cv=none; b=OazL7V4wYh0OAep4lL5u/5QgGSrC+hg7mDWrFRsJVcru9+Bs7806OiARpYb+4yzjYVlVyCSlXlmafw2JCRzkOMJQw6MM1ZwDsppTUlpsAlh1BXyiq9Xie569HxmFZqdq40JItNdkQ4zgWSwn8zBPA/VB2aycM7ddpHIXaREjsZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791774513; c=relaxed/simple;
	bh=FA7IJ8y1g44u2q72KpqUerXvklYzPv4lbagS5NmzIwY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=PZvGisv2JGvyvChhbGzBxWFOB/7LONe+1k6k6RVN5n728GGmJE/oZuVMpK/D9VA7vnmQpWpnUyOiap7MeRoIyl/BiOVhTi7UptcRWK05zBR7PwdBWQxOlW8rmZmqluoAKn/XBIUnI8f0us3VNm6Ut5w6wnsZ+RTPYSOtD1brQDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=awwMU4ZF; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="awwMU4ZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=b+vDvRRipTrI1T/VEnrSBjhQ4lBtUbOzg
	EdM1A6Isms=; b=awwMU4ZFTUj8fgNItL8kTtgoPgoWAGZ5hIZcgp3KQALrb7dHT
	RsFX2q+Gk9vDAxdh+LVWc9EiuZNwKGvldVf7c4jHgPhn2pMksns4PP4GWGn/hMn0
	+9Jo1n3f+YlDYrUyA2g5jMT2NUt79Nj81Kcux7AYxaOOS2ZGoc209kbRS0=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDnrwb0TsxqFNUBAA--.934S2;
	Mon, 12 Oct 2026 11:08:01 +0800 (CST)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 08/10] riscv: dts: ultrarisc: Add initial device
 tree for UltraRISC DP1000
From: Xincheng Ji <jixincheng@ultrarisc.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jia Wang <wangjia@ultrarisc.com>, devicetree@vger.kernel.org, 
 conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
 dmaengine@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260907101304.368E71F00A3A@smtp.kernel.org>
References: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
 <20260907-ultrarisc-dts-v2-8-5eb4c97477c5@ultrarisc.com>
 <20260907101304.368E71F00A3A@smtp.kernel.org>
Date: Mon, 12 Oct 2026 11:07:30 +0800
Message-Id: <179177445093.2537254.1384669594502107966.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791774451; l=1085;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=FA7IJ8y1g44u2q72KpqUerXvklYzPv4lbagS5NmzIwY=;
 b=ao2vMfGgIhJvOsEkfRD2rSyS9wNv15SFnwsrM4aVkJx2+fYHm+Abo4gtErAMBhbZpt82t8dGy
 /BEGb+x5AJaDyx1UvcYiPKdMVshqlbD0CEvz+7d8LgxqmnSCDYdqagX
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-CM-TRANSID:AQAAfwDnrwb0TsxqFNUBAA--.934S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyDury5Wry3CF48ZFW5Wrg_yoWDZFX_ur
	909w17Ww4DJ340kanFkr1YvF12kFsxKry3Jwsrtry3Kr97Xw45CrZ29rZav3WxK3yxWFyk
	Cr9xXFWFvw1a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z2
	80aVCY1x0267AKxVWUJVW8JwAIcxvE14x267AKxVWUJVWUGwAS0I0E0xvYzxvE52x082IY
	62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7V
	C2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF
	7I0En4kS14v26r126r1DMxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvf
	C2KfnxnUUI43ZEXa7IU0go2UUUUUU==
X-CM-SenderInfo: pml0x0xfkh0wg6xo325dul2uoofrz/1tbiAQAJDmq-VKkAAgADsv

  Hi,

  I'm temporarily taking over this patch series from Jia Wang.
  On 2026-09-07 10:13 +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Does this reg size limit of 0x400 provide enough space for 8 DMA channels?
> 
> The Synopsys DW AXI DMA IP driver (dw-axi-dmac-platform.c) maps channel
> registers starting at chip->regs + 0x100 + i * 0x100. For 8 channels, the
> maximum base offset is 0x800 (channel 7).
> 
> In axi_dma_hw_init(), the driver iterates over these channels and writes to
> their registers (e.g., CH_INTSTATUS_ENA at offset 0x080, hitting offset
> 0x880). Since the reg property defines a window of only 0x400 bytes,
> accesses for channels 3 through 7 will fall completely outside the declared
> memory region, leading to out-of-bounds memory accesses. 
 
  After checking the hardware register map, I confirmed that the DMA
  register range specified in the device tree is incorrect. Thank you
  for catching this issue. I'll correct the range in v3.

  Best regards,
  Xincheng Ji

-- 
Xincheng Ji <jixincheng@ultrarisc.com>

