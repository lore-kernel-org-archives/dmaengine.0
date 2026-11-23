Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795396659;
	b=G8ExBuAUvgSAo03BVVEPXg12gI7/F4/AyWdWwAKmkiReSxXh/XZarBO+/d8Os3D+W+iA
	 yu4hihQZXm1TQuvDxjxdRUAXDmjZBnESjC4c451r6O85cQQcEl9vrtIelTWwJTV8RXT0G
	 FXSvsTVDjgYSnr4Vl4R+rIgBxuT/29kV4srRCOjFhtn849ghvINKh50yasAdQaiKQ6HKA
	 B+E90NGF2hiZTbs5spxB6Witeokiu7G6tEItN4oYFRk1vTk62wzZMNbHfUXCCvzyDwzqD
	 /it7vtoJN0uerfPEjRltawFVaUDtvADEFCUMjw+8ICzfdMfVouMbO+Ha6MexeZuSZCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396659;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=VImCsGSXzjoMSePXdbr+fMI5jhhaz7O4wSuFYMQmz0c=;
	b=H9W7PI0yOO7FKCK3YxVmpZ+REW4QF/6EYA/e1lLYzBu/i9Atpxxn1W3PikE6/s6TbbYe
	 Bf0S8CW4ODOo93kIWQNS1zsEXh1mVwtAQsrVeZTbDC8YJkpDxoaD5UQ89ZwIGGMFBVO98
	 viDIqhOtrl2VOetRei2mkUxrr9cYd7s8RcftAPjOW44G05gzO1uL97ibNvusjq6holA9V
	 FEYsEnB7cOQZeCdvrjM/W4XNTxORMezGw6Lsn63ns4M5Zh2RXpYNdmQTtpK2t+x8+h2jL
	 krAja4KTfFYFX5RdEoR10CujXkz783/rC112+l4PLHMFMA5I+sFvIrRJqHgGyzFCJGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FZPciLk0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8852B606A33A;
	Mon, 23 Nov 2026 01:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FZPciLk0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795396659;
	b=Phwt3RGnVIQYkgBcx6OuJha0tal6kENDycxXYJvni/psvy2B8yYrTeZOq7Iz1ayitneV
	 wcHRLH4xFISan80KmkJX3nwXbywYpWTJTBJBR8GMS7Qnnz199g3UYC5ZmmjM05iq+gBfW
	 ky5LL4eldDfgtc0seCfqqCi+DUW1ZA4WRmM5Cu/sFRSeQvVDaVPF5a0DSSPA2BMH8T6Ic
	 dPsKedNshBILlvLD8zPXrATCF0iANDjREdGAYX8iIGYQF7+Or9+7JbvU8D2QEyPr4RlW9
	 Ktw1rXHZXosuvYzWlJ9lz2EPfeU5aTlRUcMazLo0j1sACvvU++3IUGIqRAaWjHHFp7g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795396659;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=VImCsGSXzjoMSePXdbr+fMI5jhhaz7O4wSuFYMQmz0c=;
	b=odhIbIMcsxxEqZoQScSXbcudlTluDt0kO3guKXcl8v2rZo12MNMuF38rDbHI8DGFUvBt
	 6GiHfDgv8YuPW3Hu85MbwmYYBDPJXKq3z60gsjQePyELKVN6IXtspuP0lkfu+jExyfyH1
	 ocIUaRXq3k35umy6pvuhuLJ423kTRHr8zHXnaPn7/UG5IDP/CU8d+Z3HVya/yIj9flMM3
	 00JNMFQOzowRLScIP3xjpTpz4F//MXq6GMI/gfl7dk3qesCesY7zhs7NBHtW8IqoR0lei
	 QP1V0F+AxZ6JxESU/Lo44Uy36XbMbCXNaEUYjWihAqz6tH7uG2Jf29YPgjz47WNGL8Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90D8F1F000C0;
	Mon, 23 Nov 2026 01:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396659;
	bh=VImCsGSXzjoMSePXdbr+fMI5jhhaz7O4wSuFYMQmz0c=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=FZPciLk0UXg4sson+hAN/BkrBtF+pxozh91yK4PiGCH7N8C1+ekxk8qVwKUiexvk5
	 lpeiVPz5bmgwj8gNhcBhmlIVvc3cC4Jfd9apvRrXrF4h7BBbSULcEWTC8kDyghO4hG
	 oouySQGfv15fDqR1f9DbTKsqtHFXda61Q5lhRLDg/EBKcJPtYz+TvXS4vk8T/BDLN9
	 k1ExnO+Lh2OeSBt7BRv9VIFFS4yJoYEyGSRMrQYqd9jV1l3QkJVm2XF86mNL5s9ExA
	 zeEXo09W0XpMTpMZsL9XITLPAL///XacsexhBiTXYpvNwxNAyDGiXxk2lVeOEUuQqD
	 C/xM4GqcgM7AQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E2C254C29D;
	Mon, 23 Nov 2026 01:17:37 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] dmaengine: Kill channel tasklets in remove again
Date: Mon, 23 Nov 2026 01:17:36 +0000
Message-Id: <20261123-dma-chancnt-v2-0-241b1672883e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIADCUA2sC/yXM0QpAMBTG8VfRubayqUNeRS5mOzjKaBspeXfD5
 a+v739BIM8UoMku8HRw4NUlqDwDM2k3kmCbDKpQKKUqhV20eBfjokDEuqoNUiktpMfmaeDzq7X
 d77D3M5n4JuC+H4UEbkFvAAAA
X-Change-ID: 20261123-dma-chancnt-666878c6e31d
To: ludovic.desroches@microchip.com, vkoul@kernel.org
Cc: Frank.Li@kernel.org, dave.jiang@intel.com, linux-kernel@vger.kernel.org, 
 andriy.shevchenko@linux.intel.com, dmaengine@vger.kernel.org, 
 allen.lkml@gmail.com, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795396657; l=1886;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=M5gstoa5unIW6ysGcN08lUHOdZ09B3VvbPuhdhXnsik=;
 b=LQs0pOspOgbUIO95yvZexbf4sS3I8++eHStsRQwYgm2jYqaZHEriAT7k94R/Nd/SEVvR1qzKk
 Ztf/Alz9L51DCtlvbeNuOaqeczz3adTd1LScgJyiWWTK6z3k5yjeTHp
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

at_xdmac and idma64 kill their channel tasklets in remove() with a loop
over dma.chancnt after dma_async_device_unregister(). Since commit
e81274cd6b52, dma_async_device_unregister() unregisters each channel
and decrements dma.chancnt for it, so chancnt is 0 when the loops run,
they do nothing, and a tasklet scheduled by an interrupt can run after
the devm-allocated driver data is gone.

For at_xdmac, just making the loop run again is not enough, as the
Sashiko review of v1 pointed out: the tasklets and
at_xdmac_free_chan_resources() would then run after the channel
devices are freed and the clock is disabled. v2 moves the IRQ, tasklet
and channel cleanup in front of dma_async_device_unregister() and
clk_disable_unprepare() instead. idma64 has no clock to disable and its
virt-dma tasklet uses neither the registers nor the channel device, so
patch 2 is unchanged.

These loops are also touched by Allen's "dmaengine: migrate channel
tasklets to WQ_BH" series (v4, 01/33 and 04/33). The two fixes don't
depend on that series. Whichever goes in second needs a trivial rebase.

Found with a static analysis tool and checked by hand. Compile tested
on x86_64 with COMPILE_TEST (W=1); I don't have the hardware.

Changes in v2:
- 1/2: move free_irq(), the tasklet kills and the channel cleanup before
  dma_async_device_unregister() and clk_disable_unprepare(), instead of
  saving chancnt; add the Fixes tag for the original driver (Sashiko).
- 2/2: unchanged.

v1: https://lore.kernel.org/all/20261123-dma-chancnt-v1-0-f0eea0a4bb63@gmail.com/
---
Suyuan Wang (2):
      dmaengine: at_xdmac: Kill the channel tasklets before unregistering
      dmaengine: idma64: Kill the channel tasklets in remove again

 drivers/dma/at_xdmac.c | 19 ++++++++++++-------
 drivers/dma/idma64.c   |  4 +++-
 2 files changed, 15 insertions(+), 8 deletions(-)


