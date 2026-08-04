Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F6741DEDE;
	Tue,  4 Aug 2026 07:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785828528; cv=none; b=sQN/CdttFKDBHlBD9zHdzh273UYhK0ukQyRA2NyLtsu1OWJ+xmH5+HVaPLHOlWopB97qYVg/Q1bstwbHvH/IfTVfbYXuBUaTAU72aTM0ZBwzAaGF3mrCV3bJjdRIsBN4bZ3lVs4Gne54bincMiJE2p1mUfMDV2B6YD4zeNncgH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785828528; c=relaxed/simple;
	bh=1k+t4VolBe0laWMSM35QlxzZTvElA+9xlWizIlipJKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KG7zKDvqpqJJrwTLK4XgAOERY4TnIO+Kp+hZ6+Sszi0TY74otibpJSwfEbgKxnRrkksheGpxdT702f+T+NXN6eAJbxj4yI6869ble73W3IHHwbpj5psIqVezoGRnK0GY7nrEoQY+UQgcJ72xSYJ8FtK5qPU5kUeJvk7Sqjkj7FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ikSm3iVo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ikSm3iVo"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 063B9493;
	Tue,  4 Aug 2026 09:27:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785828448;
	bh=1k+t4VolBe0laWMSM35QlxzZTvElA+9xlWizIlipJKk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ikSm3iVo1D6z+cyqqS1JsZ5232679qhOk1We1P5Mvcw5SYW6ivf8PMmAzN9JW4Ery
	 4wMk98jfC5XOTSgi0lLWZPoO1Yo1h7VG7Xu9vCh/sfPsZzzTzj4SlgkB9j0NNwqROM
	 cojNekDAdSHknZuL0almOiW5mU5b1mWWStlEuojE=
Message-ID: <dbc0aa08-fadc-41bc-a8f7-ba39719b6479@ideasonboard.com>
Date: Tue, 4 Aug 2026 10:28:34 +0300
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: xilinx_dma: Use readl_poll_timeout() instead
 of atomic variant
To: Alex Bereza <alex@bereza.email>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Vishal Sagar <vishal.sagar@amd.com>
References: <UR3xiwNn0coPyYguDWjjQi-IWPyN8Surtot50IAldzugiznKwuwlVUScNRaQ1TMK5KEQcdglATeQVSWqQrsOuw==@protonmail.internalid>
 <20260803-xilinx-dma-poll-fix-v1-1-892302c4847d@ideasonboard.com>
 <DKFZ162370HZ.2XC8HNVB1DU6H@bereza.email>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <DKFZ162370HZ.2XC8HNVB1DU6H@bereza.email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/08/2026 10:12, Alex Bereza wrote:
> Hi Tomi,
> 
> seems your patch is not based off the current dmaengine tree. Please
> have a look at
> https://lore.kernel.org/dmaengine/20260402-fix-atomic-poll-timeout-regression-v4-0-f30d6a6c13cb@bereza.email/
Thanks, I missed that. Problem solved, ignore this series!

  Tomi

