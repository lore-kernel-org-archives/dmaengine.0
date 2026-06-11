Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6733403E4;
	Thu, 11 Jun 2026 05:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157098; cv=none; b=EGG9F3lF2VZIbs5QtfyNa7UPICpnNoKgp8RTXN8Qg69/5FMcxehnzyUbvhpWXlMx6gWlacIO+DWXIzcUEgLLw57WZu9QYTRdfziIiCEShA68M4bkVupl0Um/H9mRlztFUk00yfFWCJ3sGBVmPUB2vQ2o219iBQaz//C+H6ZJG0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157098; c=relaxed/simple;
	bh=Rb/qUWrXJRMpInmR4X67RVAnFt1nl/S006r5TH3wamM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PYEoLVEGMjIHWxZ5+dvF/c/B18XSfYtKOxM9HS0RYlpbwlpIfiZKaFCnOBJqH9RBMXMWaNlXK3vM6u+qAJLbUD8Kq28rseez5tPvvJPgGBRaqLybjpiuHMvRxRkxyir3NRDrnlFAb0lHYYEQhZMcDNVH4VJsUzMKglgFmbL0gTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BU2PR8lh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BU2PR8lh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF061F00899;
	Thu, 11 Jun 2026 05:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157096;
	bh=sqxK62LKfv/ElL6iO+sr8Jcv2LCegaunlHS2uE77bKw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BU2PR8lhDFtObrdPaHJPWX4CVFVPI7PoZ29yw4rL4Ks7Ywo35kF8ZbAe395qBG6mb
	 6WLvuto6sDhNX9ydOXJklbvfwrdT63W1nrfldlfqlQvyZ0KgIHi6efRXIlfEgE6Tly
	 tECe0oHvUsU+WqC/famDeIGxCt3/L6bjP548/9wArubQhR8VLY3wJaztgPbe9tX/X4
	 4RfftrigZnS2qdnNZLpQOIIDYoyr8SlvZ76pSDHY9GqOKAxOdZ84QvMw1nIcaHEgxy
	 dj8EXthVfh+4vfMgRau/GCJIhTMBAVA9JJcuRV4ITIh5h8WRUwo587VwQtxC2cE+Z4
	 oxECcL3sVvI/Q==
From: Vinod Koul <vkoul@kernel.org>
To: mani@kernel.org, Frank.Li@kernel.org, 
 Devendra K Verma <devendra.verma@amd.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 michal.simek@amd.com
In-Reply-To: <20260608102452.3255808-1-devendra.verma@amd.com>
References: <20260608102452.3255808-1-devendra.verma@amd.com>
Subject: Re: [PATCH RESEND v2] dmaengine: dw-edma: Remove
 dw_edma_add_irq_mask()
Message-Id: <178115709406.468137.3949764388151149667.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 11:21:34 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 08 Jun 2026 15:54:52 +0530, Devendra K Verma wrote:
> Function dw_edma_add_irq_mask() sets the mask of the
> interrupts alloted to read / write channels in a variable.
> The mask set for read / write channels is niether used nor
> this function is called else where, making it redundant.
> The redundant function can be removed safely as it is
> not affecting anything.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: dw-edma: Remove dw_edma_add_irq_mask()
      commit: 57e766bd3ddb2495d80952ad4fc723fb538e1d43

Best regards,
-- 
~Vinod


