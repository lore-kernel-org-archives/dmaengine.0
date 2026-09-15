Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978144BFE78;
	Tue, 15 Sep 2026 17:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493794; cv=none; b=B8hkm3Oz7/mqsnPGkXLfbd2nkSChy2JadhL+ZQiMkmmqNnvCUo/mjmSY9715JNOzZP8bPP/CVljIIbF1LUu1CP4sR9aWI6Gz0Tj40D6t2W2T1f95X7P3Ytbci6MwGZLAZ3wYaTJRE6gCc3tN00UQJNdU+xqVb0j0BZTASDXhtlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493794; c=relaxed/simple;
	bh=VdEHGVqakceA30ibKfWLrLkrYGmQTQMtsf1/cQuEh4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u9j9X7S4Lo5UUuvoxIlAc2S88r/dcbzO2blPY5gjT52Mr9NLEv4FEtztCOwph2QMCSDtImpp6L0TElbOa2+WLwgHrQw2m/fJ9i2LJtLpV6DDdU7p5CXx02rndd+wdcKuQmHLA8vNVXCp8IbqPrljhdY8eICk6SSulFfIf94VAOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYCjdh1e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYCjdh1e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAF01F00898;
	Tue, 15 Sep 2026 17:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493792;
	bh=FnLmeYIQPAAgZAXOCOf2VNKKiWote+e9JLjawzWka4Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hYCjdh1eHRYYE/giaeiVwVAAN7Grmep6NWmTu/EfTZ1VRqjb8MNwkBoahrZdrkqGE
	 vdWJ1VmACNvzykGU2kRHMkCZBPsJL0OwZAoXieuoQawaoE08VgFF6Yof3mj1Ryo/i4
	 aPer0R1/wEwhya2O5zy7O9OUhitpFfs/rJ5083su9dwmSX1cZmJQXBJTkFDS0sGPSh
	 qAUJpB2b2g8NYlyn2FnTB0g6n0aNeByQlNsBc5jQuHi2HE3mOnBZvbGZNST2JElCLS
	 PHmxL+Kafqg5HfWILWizuW9IKIHOqNuoPa+Hvhxj+GaCXcPavQZKl4TsLx3FpqWGLe
	 gRjj5EFMbDc2Q==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Zhang Wei <zw@zh-kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260910202846.48941-1-rosenp@gmail.com>
References: <20260910202846.48941-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] dmaengine: fsldma: kill tasklet before removing
 channel
Message-Id: <178949379014.248239.9161202230659885240.b4-ty@kernel.org>
Date: Tue, 15 Sep 2026 23:06:30 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 10 Sep 2026 13:28:46 -0700, Rosen Penev wrote:
> Add tasklet_kill() in fsl_dma_chan_remove() to prevent a race where the
> tasklet is scheduled by the IRQ handler and runs after the channel has been
> freed.
> 
> 

Applied, thanks!

[1/1] dmaengine: fsldma: kill tasklet before removing channel
      commit: 32ac4723e5526c44e5a1f3b1586578c17647f2ef

Best regards,
-- 
~Vinod


