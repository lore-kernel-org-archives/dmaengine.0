Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3EA49C4A4;
	Thu, 10 Sep 2026 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049417; cv=none; b=d9jrlZr6qz3IiJhRBIxxOKufJulNtjoSw/KdtimWWvrFj2O8N5cCEUscPi7wJwl8PtMCQnkJyhahZUFjQ34ey92rNblGIwlyqoM0N8rO0NmT7B2OjxWyS2Ahk29rPwXiY3NN1sZpUe75jvbxZKM5RZs9xre2EmidUxkuMW7Hgzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049417; c=relaxed/simple;
	bh=nii/9tnFMtwP25w9km02CbCJDBIHJcwxgbtU3IvsJq8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fEe1aWtwSoe21iI5kHWHEVVm2J29fKy5WMy0nLLC7lKrPQQf42BAANgTip/ETSleYwgMqL96eIimkAxhIBZm3vCyJ8DOyFssc+ZXvxS3aBda6U31RhP8jKsG0blDw5PWTm24DH/X5Dx5k52cGnvLOEYPauHA4DzhxqKeWVf0pAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oka/mgTE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oka/mgTE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160B51F00898;
	Thu, 10 Sep 2026 14:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049415;
	bh=juw/3QKNqRTmgk1+0eF/VHaexRxlX6b1AcYjpD72T44=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Oka/mgTEUBoP0pxGiPFY/MJJ29nlYP13fYl48abmVkJrkuyE1Ui0UaqY/6mM5ig3G
	 kLkD0gIz7YAjo/SoQqSVbfHMPjhXBcv/ARfK4FOzYytiwBRM+XU0JRrp8/RastiVtM
	 8Lx3vM0Ls3dqtRaJir7nSpwjxHOB0Eox6RrCqthAYGx+7sG6h3tdyDlf5KV/erIuRw
	 karQd6fSBlxjzJ3RT1zeidqVEgl4Q55i4yJyWYUHIS9PQmQAcoFThX+fnrk0PcIRpZ
	 FEaz3vVvgOsx3IeM8S690+tYkzYiY7QkLLH+NaDSeFQCHFJds5bRymHuY85AtpgWzo
	 h0DNeH0EiQQig==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, Paul Mackerras <paulus@ozlabs.org>, 
 Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org
In-Reply-To: <20260817015442.136038-1-rosenp@gmail.com>
References: <20260817015442.136038-1-rosenp@gmail.com>
Subject: Re: [PATCH] dmaengine: bestcomm: set bcom_eng to NULL on probe
 failure
Message-Id: <178904941261.118320.13277747986568598542.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:40:12 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 16 Aug 2026 18:54:42 -0700, Rosen Penev wrote:
> Functions like bcom_task_alloc() use if (!bcom_eng) as a safety readiness
> check. If the probe fails and hits this error path, subsequent or concurrent
> API calls will bypass the check and dereference the freed memory.
> 
> 

Applied, thanks!

[1/1] dmaengine: bestcomm: set bcom_eng to NULL on probe failure
      commit: 140ebb6d10559a7d2d0c597926f1bfacf03c9f29

Best regards,
-- 
~Vinod


