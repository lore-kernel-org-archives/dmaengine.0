Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500D12FD69E;
	Tue,  1 Sep 2026 06:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243439; cv=none; b=Z6Z25g343xv8D6P+hw41mrKEv7AMYwFsJseRrqNMY9I0gQQaOR+2njT7OUnfb76nILls9q9I+UOsavxYTDXRR/TthWqFnIP/58/G5MhkTs3wfxhwXUPegTnc+Vwv0o10eZ7/9wiENp7crAvIx7vdB7WaMgCuTrsjb6V/iiavdOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243439; c=relaxed/simple;
	bh=WTBa/DiT+oOaMljgC89vI6tMNiEqdrXapbHe1KVO6yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BG41TlV94QlMxCTaF4DprFLJOvOaq8xPVMyYPNjXdp6c3m7zhLjH+DiPq1L0WM3mZ8uU1dnWW5OpfHbjEHiPRkuBPHAKM+5stiFjHttxUasr6OO3+S55rzlRI5kpESN3QwXpwe6Nsov7YOhVFtaKwc4sSrSYhl6osrmo8J3OB2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=M0/Fmfr6; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="M0/Fmfr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=3l+/qphVp4ji7i7AgZkxZexlT3y15/s
	2wWfx6fvuko4=; b=M0/Fmfr67mlwuZrNmXvHy2jppIIAkWCG0m0TkR8D/lz2nFY
	lcHtVtRyMXHAlTflijPKJA4IiXEmjeyQj4xyZiIDGxJHWEJLNpjB8il9vXit2I6V
	L9Nm1HqLjjUPcFYSDdzVYOyTjqE35Jq5C+ABfTxMnzx2m0KZB/2C3O3E+Bm8=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDnrwbjbZZqXCAAAA--.118S4;
	Tue, 01 Sep 2026 14:17:15 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Tue, 01 Sep 2026 14:16:05 +0800
Subject: [PATCH v2 2/4] dmaengine: dw-axi-dmac: Fix LLI dump out-of-bounds
 access
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dma-fix-v2-2-d7f0459ebb14@ultrarisc.com>
References: <20260901-dma-fix-v2-0-d7f0459ebb14@ultrarisc.com>
In-Reply-To: <20260901-dma-fix-v2-0-d7f0459ebb14@ultrarisc.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Pandith N <pandith.n@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788243415; l=1288;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=WTBa/DiT+oOaMljgC89vI6tMNiEqdrXapbHe1KVO6yg=;
 b=QtzO0A2J7k9yAgUttLQhzc158+MIwWNX9NlSZW3fKFtvgp2B8f9a89tiwqSv0GCOb9kCFikWI
 ekhFA3TRu2JDwIuI62Fz2sChW4iePWFOcH5mb8DzxXuw7AY1E9furGR
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwDnrwbjbZZqXCAAAA--.118S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WF4fAw13ZrWUWr4ktw1fWFg_yoW8Jw4fpF
	WrJ3yxZryrKF9xGay8Xw47CrWUJayUXFWIvw4jy3savasYqrsYvw1kK3WFkF1DGF95ZF42
	vF4jkryfAF43ZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUtVW8Zw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	W8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7V
	UUTGQDUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAREWqVJKMAYAACsb

axi_chan_list_dump_lli() uses the channel-wide descs_allocated count to
walk the hw_desc[] array of a single transaction. If multiple
transactions have allocated LLIs, the channel count can exceed the
transaction-local nr_hw_descs and make the DMA error path read past the
end of hw_desc[].

Use the descriptor-local nr_hw_descs count when dumping LLIs.

Fixes: ef6fb2d6f1ab ("dmaengine: dw-axi-dmac: simplify descriptor management")
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 742e08cfab43..61230d2b1c56 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1052,10 +1052,7 @@ static void axi_chan_dump_lli(struct axi_dma_chan *chan,
 static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
 				   struct axi_dma_desc *desc_head)
 {
-	int count = atomic_read(&chan->descs_allocated);
-	int i;
-
-	for (i = 0; i < count; i++)
+	for (unsigned int i = 0; i < desc_head->nr_hw_descs; i++)
 		axi_chan_dump_lli(chan, &desc_head->hw_desc[i]);
 }
 

-- 
2.34.1

