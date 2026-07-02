Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6278D3161A4;
	Thu,  2 Jul 2026 16:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008230; cv=none; b=QusDJFiD6/o/lC8dHw0l3KFN55/n/7iS5P+hUdVnPU67bIOs5dXMsmBB3j6zBxchxkhgYLbEhwAVa2ZPa/TtPTIkMJirTBlGQxAYbdqVimhVffMsssUijaFrIryc2Tc6uKNxABgh5PsBFmapyQWSbTBYWJP7gggq+YTBsh5I/64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008230; c=relaxed/simple;
	bh=JYg5ysdWFhPiKG5oQW3/CJhMcQ8XRUuITz8PCAg+EWw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aw3ty3uMEFWFpgKH04zYWd2PeOsjQjEJIHY6htI6wLRdf1TlS96WcKT/CuPWa3kZ/hT3h2Sbk/sUvx4OQa161HxRCALVg/okKhVgZqp3b90NF0Sm4Zx3rVcnh9N9y+1ZORdx5gNI/1TMYr8dqVOszj0gtTxRp8MUgxwQi2nTRjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVjNS9G9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVjNS9G9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFB71F00A3A;
	Thu,  2 Jul 2026 16:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008229;
	bh=UtNd6BSHdRaL0Wa1rIKAQuRLmED7YnoMHeDT0+9L1os=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YVjNS9G9IcSAAFNX7IuV/uQMIz74W5Vz5r3Ondup6k/Ze9BrwqgCXPAJE0/Whc5Bd
	 oc0DhkAPFmuwawqja0ZY9D2/nW/3FLynz8BBGDnP3SfzV+OQ61/4POGaYdfxW21aFt
	 ru27hIJ5csE+s2Uv+FvarXZP/yvBYUFED2E/1O0SeK014fZ99f8b7a0rK3FWe7XTTq
	 tbazRlxXn4wCTb9RJA8Dol2r+qpTGNkThydlUkP/9/oejjfh6R2xlFJp8b+cbX58WH
	 1hcDep6PFJgKFiZcBYQHZuMG5JW9GxJgrlncXGfMut0v+uFVgw967kRf0NcSQBUZFA
	 VFEENUyobEmVA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@kernel.org, michal.simek@amd.com, abin.joseph@amd.com, 
 kees@kernel.org, ptsm@linux.microsoft.com, sakari.ailus@linux.intel.com, 
 radhey.shyam.pandey@amd.com, u.kleine-koenig@pengutronix.de, 
 Golla Nagendra <nagendra.golla@amd.com>
Cc: git@amd.com, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260630064844.705173-1-nagendra.golla@amd.com>
References: <20260630064844.705173-1-nagendra.golla@amd.com>
Subject: Re: [PATCH 0/2] dmaengine: zynqmp_dma: fix race between runtime PM
 and device removal
Message-Id: <178300822534.756665.17882853364669506909.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:33:45 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 30 Jun 2026 12:18:42 +0530, Golla Nagendra wrote:
> This patch series addresses two issues in the zynqmp_dma_remove() function:
> 
> 1. Fix the race condition between runtime PM and device removal where
>    pm_runtime_disable() was called after the power state check, leaving
>    a window for the runtime PM framework to change state unexpectedly.
> 
> 2. Update the stale kernel doc comment that still references a return
>    value after the function was converted to return void.
> 
> [...]

Applied, thanks!

[1/2] dmaengine: zynqmp_dma: fix race between runtime PM and device removal
      commit: 516ba2d8b7aac4238f9fcbd58579c43c71b9b695
[2/2] dmaengine: zynqmp_dma: fix kernel doc for zynqmp_dma_remove()
      commit: f7e89cba18a1ca6462712ae459a88dd40537b693

Best regards,
-- 
~Vinod


