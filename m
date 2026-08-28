Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C19249620;
	Fri, 28 Aug 2026 00:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787878117; cv=none; b=LW4o/VCRbQxiirfhkf4h2VOH3ySrV/0Uwq63uE7TC5TvqMs7c44GCgymno8Y+ISFXuQG56PIZCdgwFRjhxLr9pYyJVsqnZmbT+iSG75KUfdUij7bzh7G6Kf7kYx22OXjiH2kmGsHCM18s+NucsZesZH64FodB3uYHLTCJQOVRIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787878117; c=relaxed/simple;
	bh=9IWK4d256oXlb+IvxJTy8UGD2nEDY6peJSN/lkGgG1k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HqDMNx+giNbgBtI+/AVCHblyBD3Fa8yZIncTrGMiJ9l3lprR9XUumHe422HYXaB9jSGEibgpXEfJB1+Kd3DsNiSC8yHEq0kBrsxLaPqqWUClu4/CHpWBN7uJevY98maWi1Mra3/ba5RSFdIqe8IRv6nuNzRV7S8I9bMFt7retQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=ZFFdtbw2; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="ZFFdtbw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Subject:Date:Message-Id:
	MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc; bh=f2
	ZgYpri4Ui2s0xfjbS49cVkIp4V+/OGM1+uUm2jHLA=; b=ZFFdtbw2UlmlPF5x7/
	pgwKvC3aWtdg6SwsY33eq3aokvALQGtwJ2u9hgB3x+QABk3bWZwRHnyOO+SCr6Rn
	s7tMMQe16FBhrS78zs8UxxXInlWzTygRtMqZDaQ9gW5FqfFODtrsdQ5Gf3HAR00f
	uCiGAxPqiF97hG2i7+23F8bhk=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwCXxs3p2pBqHmMBAA--.589S2;
	Fri, 28 Aug 2026 08:48:41 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Subject: [PATCH 0/2] dmaengine: dw-axi-dmac: Fix burst length encoding and
 LLI dump
Date: Fri, 28 Aug 2026 08:48:25 +0800
Message-Id: <20260828-dma-fix-v1-0-a6947f487e07@ultrarisc.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANnakGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyNz3ZTcRN20zArdZKMkI3NzS9PkVEMjJaDqgqJUoDDYpOhYCL+4NCk
 rNbkEpF2pthYAMXR/82sAAAA=
X-Change-ID: 20260827-dma-fix-c2b27795ce12
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Pandith N <pandith.n@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787878108; l=1098;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=9IWK4d256oXlb+IvxJTy8UGD2nEDY6peJSN/lkGgG1k=;
 b=OVKjqOxiacC923bVsa2u6YMGQiS50tCjyJ7UUtO//ShCFvkwZhhctF5HmowAcWzMRfiHpiIKf
 z9EGxMg+fP1DRwl2XsUMZ2NTKNBS3sYl1zEDBhW1JLF3P0oOWzVEBOE
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwCXxs3p2pBqHmMBAA--.589S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFyxCr43KF43ur15Jry8Grg_yoWkGrg_C3
	929Fyag3yDtrZFy3y0kFn2vr1UuFWkXrWYvrs0yry7CryxAr4YkayktFyrAr9rXayrGr4f
	Cr1fJFySyF13tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
	6r43MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa
	7VUbGQ6JUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAMEWqPrHsAIwAIsF

The first patch converts the configured AXI burst length from a beat count
to the ARLEN/AWLEN encoding when constructing hardware descriptors. Without
this conversion, a 256-beat burst overflows the 8-bit hardware fields and
may cause DMA transfer errors.

The second patch bounds the error-path LLI dump by the number of
descriptors in the current transaction. This prevents an original DMA error
from being followed by an out-of-bounds access and kernel panic while
dumping LLIs.

The series was tested with dmatest on all eight channels using
snps,axi-max-burst-len = <256>. All channels completed without errors.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
Jia Wang (2):
      dmaengine: dw-axi-dmac: Fix AXI burst length encoding
      dmaengine: dw-axi-dmac: Fix LLI dump out-of-bounds access

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
---
base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
change-id: 20260827-dma-fix-c2b27795ce12

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>

