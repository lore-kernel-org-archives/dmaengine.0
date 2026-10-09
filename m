Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3945349D5A4
	for <dmaengine@vger.kernel.org>; Fri,  9 Oct 2026 09:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538689; cv=none; b=ue7BKEEpCfJJ6Qefk0UwI00bT64V+vJvCmIM0xg+42HdEPd1D0gSMZTZ8iDJTWVXUW4A4U9n1o1wDbh7nCAKajyrQtGXQQI7Ksxw72K75xPCJGIM5QUwcC6ZiTvW/kEyC9IRgMs2DTuyOfl/thg7e1Bvo7D40QcOEpvks0LqsAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538689; c=relaxed/simple;
	bh=qSYWk1e58mK2ErZjT9tbiGd4wSPwGva8YP6/Lhb7Tak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l9dfAptkPRWXhNQnzqGryJwP4WlaBKxi92e0XM8Cf3hVcXg0SRneOHq/KQ+M5JVjRiHHJ0hOkWG78U39NK4QwBVjWflu5nqdQ/FQwiDiMNcea+F6CRdDrokRuxiGstiy2DYFU1+q1NPVrlYMhVGybMhrbh/lgXxerDZgWabQDSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FUYr+OOY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FUYr+OOY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74311F000FF;
	Fri,  9 Oct 2026 09:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791538674;
	bh=p74cu4GbDqjLHFYWqU0yIKvg+3K83/ELrL7jWPCdBrM=;
	h=From:To:Cc:Subject:Date;
	b=FUYr+OOYBLpgz94HpabdoTjew/NTrRrHhTAlDbA5GBcPtvdbzxpe83o1kjNQGfHWV
	 Z3Y1MXPG5wrbbNE0luRzHPljH+kkNLkiaCf7pzU2ASd28fJsw0tMvzP4Klge2lOCvT
	 bmxIoL1Xu2Grv/PJNL558xJYCrme9J/cVgceQaVGTZjww9gQzz41ljqvbjzI2Phzbn
	 i6hMZt28ojeSPwp2EXf5mJHejH1hAMPlO/nnA4Gwz1PxYh/3vOxbZFqD9ws4Exj7hd
	 5k1WciVrqivPT5Eo4toRQkE8yxQqxoMpt9RrYMNkiBgehKApRLkCHP9bt9qzWuLxnE
	 Gh7rc2L4en8RQ==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Koichiro Den <den@valinux.co.jp>
Subject: [PATCH] docs: dmaengine: clarify ordering rules around cookie completion
Date: Fri,  9 Oct 2026 11:37:44 +0200
Message-ID: <20261009093745.539924-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko pointed in [1] about the cookie completion order. It is good to
Document that for ensuring that dma buffer is flushed and no stale data
is seeing by consumer, we need to make sure such action is taken before
drivers invoke dma cookie completion.

[1]: https://lore.kernel.org/r/20260917072507.5BDB61F000FF@smtp.kernel.org

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/driver-api/dmaengine/provider.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
index 2897ade67b39..1bcbce705659 100644
--- a/Documentation/driver-api/dmaengine/provider.rst
+++ b/Documentation/driver-api/dmaengine/provider.rst
@@ -557,6 +557,11 @@ dma_cookie_t
 - Not really relevant any more since the introduction of ``virt-dma``
   that abstracts it away.
 
+- dmaengine drivers need to ensure buffers are flushed before invoking
+  vchan_cookie_complete() or dma_cookie_complete(). This would imply a call
+  to unmapping buffers or any such architcure calls to ensure caller seeing
+  buffers are flushed is done before invoking these calls.
+
 dma_vec
 
 - A small structure that contains a DMA address and length.
-- 
2.53.0

