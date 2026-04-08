Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F0F38CFF4;
	Wed,  8 Apr 2026 12:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775652112; cv=none; b=UbBhqBT0PI2zvIxgk1j7AvSkXVBnLuAmT76MUQXSc761qKao4SQZhu5/rBHGcQCgUOgEfzgkscGOAhW1bHB8go4Qc/IrV6v1OHyD3hiV9+K4fZaTg+flK8zGM3JB7Qfc124jwenN2S5mvgzDSnbhOfhoSWdhXDIXx8ruZ9O66Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775652112; c=relaxed/simple;
	bh=LMqWJzfF94rZChyrIXed1rTS6WeTaHpN2Sas+xgnyR8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I+S2KXI4myRS1pPDeCrm+xOKndDUrbTnElVr5LqEzXGl5PKjNV3ty1c7C+AL5GA9+RrPlAn9RMVa+SwpU9NXFjYC6C0Fo7MUlMB/Ul3dD6mtnvoZM1yPHBRUs8GRl7c0f8Fe7ZF/xb0f0BdIBQHhelSQ7KbpBFOcrR1CsyFwHzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/E17zcm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/E17zcm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D688DC19421;
	Wed,  8 Apr 2026 12:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775652111;
	bh=LMqWJzfF94rZChyrIXed1rTS6WeTaHpN2Sas+xgnyR8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=c/E17zcmQn9YWD5UaLh7wdfYd8MsSfNhvfo9YBSVzYea3T/hNHP18Ug55qO61dUkU
	 b/zHHNtNPNaDQlPXF71TLU/PgrwIwEvrjApZp8QUAoXPwZM4QGhL41w3S7wlKH1KSh
	 zVYkizSR2dpproLx92d54utf1KBn4E66NXRLeYRGwEAgsutt61YKbfWRu4poE4rxUR
	 QE48AQdst6c22krZZD+FxmgdvNFZ8C95/LvFfUciqXP1DDt6hKPCFnOvTs7+eH9L/I
	 4sAaG6XaCjJ2CYjnIot7rhp7+TLD+mWUHhlV1Ltwa8578B0G7H8vZTLKhMi9tEtDix
	 kXQoYqH4rc/zg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03501073C93;
	Wed,  8 Apr 2026 12:41:51 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v3 0/4] dmaengine: dma-axi-dmac: Some memory related fixes
Date: Wed, 08 Apr 2026 13:42:39 +0100
Message-Id: <20260408-dma-dmac-handle-vunmap-v3-0-2456ad292154@analog.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6DIBBFf8WwLg2ConbV/2i6QBiUxldASRvjv
 xdsmrQLF7O4mXvPWZEDa8ChS7IiC944Mw4hsFOCZCuGBrBRISNKKCeM5lj1Ip7E4as6wH4ZejH
 hMhOEK12olDEUxpMFbZ47+Hb/ZLfUD5BzpMVGa9w82tdu9mnsfSX8SOJTTHANDDKutdC8uopBd
 GNzlmOPosXTX05xyKGBQ2iqq1wTKIv6j7Nt2xs7bu+sFwEAAA==
X-Change-ID: 20260325-dma-dmac-handle-vunmap-84a06df7d133
To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775652161; l=943;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=LMqWJzfF94rZChyrIXed1rTS6WeTaHpN2Sas+xgnyR8=;
 b=eiR8vmLkZWNGkruGVJcJLXhrucZQ49hJrYwO99kKDtqx+5Krgy6XkIythBNZgvtd9EjE0FS52
 lSn0kNJPs2OBQdre+ahw3cQjy7IO05Vp9q7AXxKDnlVXVp6AO9mQW20
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

Here it goes v3. Given there are some discussions about adding devlinks
in damengine, I dropped the patch implementing the .device_release() for
now.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
Changes in v3:
 - Drop commit ("dmaengine: dma-axi-dmac: fix use-after-free on unbind")
 - Patch 3:
   * New patch
 - Patch 4:
   * Rework to use DMA Pool API.

---
Nuno Sá (4):
      dmaengine: Fix possible use after free
      dmaengine: dma-axi-dmac: Properly free struct axi_dmac_desc
      dmaengine: dma-axi-dmac: Drop struct clk from main struct
      dmaengine: dma-axi-dmac: Fig BUG() on vunmap()

 drivers/dma/dma-axi-dmac.c | 77 +++++++++++++++++++++++++++-------------------
 drivers/dma/dmaengine.c    |  3 +-
 2 files changed, 47 insertions(+), 33 deletions(-)
---
base-commit: b7560798466a07d9c3fb011698e92c335ab28baf
change-id: 20260325-dma-dmac-handle-vunmap-84a06df7d133
--

Thanks!
- Nuno Sá


