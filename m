Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D57230675F;
	Fri, 28 Aug 2026 00:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787878118; cv=none; b=SxR4QStwgEAo/xS+rOP172jJHaEAwA7+PDK8wVSMmRfXLW9DJigdWN02gnzUxve91RHOFGKXs74UlB60Pvkx/zxtgK2LJb5C2m9RlcH0nK9LB6c4/DTIQh3EUJJHyvmL0wsmbBoKEXvSdyKiwQeRiLmo2Kn9+319ytHEJv1h7MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787878118; c=relaxed/simple;
	bh=qUf0tWnWOEng5OgNjM4mCzyydn/KQZFJkgi8w/3pzgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aNakV/5Rh6o/utVJoRZjAYj4MI+RWwqBXp1iL9bzeQhh3Uwi+/JCzjuKRvoqF5rrEJC5lh5H0TNAlcNrqsI+hQd9tPaW7hCq3NrYUOCRgreavM9DvjnPQWcQzMHZX6uf0OnCaoUJhyIW34qi/r/vYMOjr26sJIqXjLntxfPg/ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=PU0rKjk5; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="PU0rKjk5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=GRoYM0brQmdDMaezx5bJq85ueyTx++t
	7ZvC1Q3nljbs=; b=PU0rKjk5i67WH3IXaeKvCGibRRZnQrBBiXprosuAEA/wjLI
	83AXrxT0TRHgIh+6Xclttae0BmKU1WiKbHk4YXzDh5S0xLsMj7DSjBh8BKge983I
	vObS8r9ZamgF17lqXDQvMDfaSz7jkfKwwMhWpkLZANN7vtVPs3FeccQ0OsFE=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwCXxs3p2pBqHmMBAA--.589S4;
	Fri, 28 Aug 2026 08:48:42 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Fri, 28 Aug 2026 08:48:27 +0800
Subject: [PATCH 2/2] dmaengine: dw-axi-dmac: Fix LLI dump out-of-bounds
 access
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-dma-fix-v1-2-a6947f487e07@ultrarisc.com>
References: <20260828-dma-fix-v1-0-a6947f487e07@ultrarisc.com>
In-Reply-To: <20260828-dma-fix-v1-0-a6947f487e07@ultrarisc.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Pandith N <pandith.n@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787878108; l=1273;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=qUf0tWnWOEng5OgNjM4mCzyydn/KQZFJkgi8w/3pzgU=;
 b=yupluAKKaBvidmMIoR4wP/PiWMt6s5ZFVuYaGwVEF9CA0cM8d8HF++PDSXte2RkHA6arRgybm
 p6mXz08zXGEC0b9NP/Qtbrzc+dqSGciP18ksREA9RLqrd+EcewZdoRb
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwCXxs3p2pBqHmMBAA--.589S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WF4fAw13ZrWUWr4ktw1fWFg_yoW8Jw15pF
	W5J3yxZryrKF9xJay8Xw47CrW5JayUXFWIvw4jy34SvasaqrsYv3WDK3WFkF1DGF95ZF42
	yF4jk34fZF47ZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r43Mx
	kIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUc
	zV8UUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAMEWqPrHsAIwAMsB

axi_chan_list_dump_lli() uses the channel-wide descs_allocated count to
walk the hw_desc[] array of a single transaction. If multiple
transactions have allocated LLIs, the channel count can exceed the
transaction-local nr_hw_descs and make the DMA error path read past the
end of hw_desc[].

Use the descriptor-local nr_hw_descs count when dumping LLIs.

Fixes: ef6fb2d6f1ab ("dmaengine: dw-axi-dmac: simplify descriptor management")
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 742e08cfab43..858004b5a846 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1052,10 +1052,9 @@ static void axi_chan_dump_lli(struct axi_dma_chan *chan,
 static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
 				   struct axi_dma_desc *desc_head)
 {
-	int count = atomic_read(&chan->descs_allocated);
 	int i;
 
-	for (i = 0; i < count; i++)
+	for (i = 0; i < desc_head->nr_hw_descs; i++)
 		axi_chan_dump_lli(chan, &desc_head->hw_desc[i]);
 }
 

-- 
2.34.1

